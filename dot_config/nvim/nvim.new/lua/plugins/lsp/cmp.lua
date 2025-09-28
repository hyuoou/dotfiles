return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "dmitmel/cmp-cmdline-history",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "onsails/lspkind.nvim",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "windwp/nvim-autopairs",
    },
    config = function()
      local cmp = require('cmp')
      local keymap = require('cmp.utils.keymap')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local lspkind = require('lspkind')

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-c>'] = cmp.mapping.abort(),
          ['<C-e>'] = cmp.mapping(function()
            vim.api.nvim_feedkeys(keymap.t('<End>'), 'i', false)
          end),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            menu = ({
              nvim_lsp = "[LSP]",
              vsnip = "[vsnip]",
              buffer = "[buffer]",
              path = "[path]",
              cmdline = "[cmdline]",
              cmdline_history = "[history]",
            })
          })
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'cmdline' },
          { name = 'cmdline_history' },
          { name = 'path' }
        })
      })

      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )

      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
  },

  {
    "hrsh7th/vim-vsnip",
    lazy = true,
    config = function()
      vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/vsnip"

      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if vim.fn['vsnip#jumpable'](1) == 1 then
          return "<Plug>(vsnip-jump-next)"
        else
          return "<Tab>"
        end
      end, { expr = true, silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if vim.fn['vsnip#jumpable'](-1) == 1 then
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
      local npairs = require'nvim-autopairs'
      local Rule = require'nvim-autopairs.rule'
      local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }

      npairs.setup()
      npairs.add_rules {
        Rule(' ', ' ')
          :with_pair(function (opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({
              brackets[1][1]..brackets[1][2],
              brackets[2][1]..brackets[2][2],
              brackets[3][1]..brackets[3][2],
            }, pair)
          end)
      }

      for _,bracket in pairs(brackets) do
        npairs.add_rules {
          Rule(bracket[1]..' ', ' '..bracket[2])
            :with_pair(function() return false end)
            :with_move(function(opts)
              return opts.prev_char:match('.%'..bracket[2]) ~= nil
            end)
            :use_key(bracket[2])
        }
      end
    end,
  }
}
