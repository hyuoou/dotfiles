return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "dmitmel/cmp-cmdline-history",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "onsails/lspkind.nvim",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      -- "zbirenbaum/copilot-cmp",
      "windwp/nvim-autopairs",
    },
    config = function()
      local cmp = require("cmp")
      local keymap = require("cmp.utils.keymap")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = "none",
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          }),
          documentation = cmp.config.window.bordered({
            border = "single",
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-c>"] = cmp.mapping.abort(),
          ["<C-e>"] = cmp.mapping(function()
            vim.api.nvim_feedkeys(keymap.t("<End>"), "i", false)
          end),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "copilot", group_index = 2 },
          { name = "nvim_lsp" },
          { name = "vsnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local menu_labels = {
              copilot = "[Copilot]",
              nvim_lsp = "[LSP]",
              vsnip = "[vsnip]",
              buffer = "[buffer]",
              path = "[path]",
              cmdline = "[cmdline]",
              cmdline_history = "[history]",
            }

            local symbol_map = {
              Text = "󰉿",
              Method = "󰆧",
              Function = "󰊕",
              Constructor = "",
              Field = "󰜢",
              Variable = "󰀫",
              Class = "󰠱",
              Interface = "",
              Module = "",
              Property = "󰜢",
              Unit = "󰑭",
              Value = "󰎠",
              Enum = "",
              Keyword = "󰌋",
              Snippet = "",
              Color = "󰏘",
              File = "󰈙",
              Reference = "󰈇",
              Folder = "󰉋",
              EnumMember = "",
              Constant = "󰏿",
              Struct = "󰙅",
              Event = "",
              Operator = "󰆕",
              TypeParameter = "",
            }

            local kind = lspkind.cmp_format({
              maxwidth = 50,
            })(entry, vim_item)
            local kind_text = kind.kind

            vim_item.kind = " " .. symbol_map[kind_text] .. " "
            vim_item.menu = string.format("(%s) %s", kind_text, menu_labels[entry.source.name] or "")

            return vim_item
          end,
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "cmdline" },
          { name = "cmdline_history" },
          { name = "path" },
        }),
      })

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      require("config.highlights").nvim_cmp()
    end,
  },

  {
    "hrsh7th/vim-vsnip",
    lazy = true,
    config = function()
      vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/vsnip"

      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if vim.fn["vsnip#jumpable"](1) == 1 then
          return "<Plug>(vsnip-jump-next)"
        else
          return "<Tab>"
        end
      end, { expr = true, silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if vim.fn["vsnip#jumpable"](-1) == 1 then
          return "<Plug>(vsnip-jump-prev)"
        else
          return "<S-Tab>"
        end
      end, { expr = true, silent = true })
    end,
  },

  {
    "windwp/nvim-autopairs",
    lazy = true,
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }

      npairs.setup()
      npairs.add_rules({
        Rule(" ", " "):with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end),
      })

      for _, bracket in pairs(brackets) do
        npairs.add_rules({
          Rule(bracket[1] .. " ", " " .. bracket[2])
            :with_pair(function()
              return false
            end)
            :with_move(function(opts)
              return opts.prev_char:match(".%" .. bracket[2]) ~= nil
            end)
            :use_key(bracket[2]),
        })
      end
    end,
  },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   lazy = true,
  --   config = true,
  -- },
}
