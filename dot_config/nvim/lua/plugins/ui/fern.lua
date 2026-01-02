return {
  {
    "lambdalisue/vim-fern",
    keys = {
      { "sf", "<Cmd>Fern .<CR>" },
      { "<Space>f", "<Cmd>Fern . -reveal=% -drawer -toggle -width=40<CR><CR>" },
    },
    dependencies = {
      "lambdalisue/fern-git-status.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
      "lambdalisue/nerdfont.vim",
      "lambdalisue/vim-glyph-palette",
      "LumaKernel/fern-mapping-reload-all.vim",
      "yuki-yano/fern-preview.vim",
    },
    config = function()
      local augroup = require("utils.augroup")
      local function keys(key, action)
        vim.keymap.set("n", key, action, { buffer = true, silent = true })
      end

      vim.api.nvim_create_augroup("FernMyConf", {})
      local ns = vim.api.nvim_create_namespace("fern-colors")
      local colors = require("tokyonight.colors").setup()
      local dark_colors = {
        fg = colors.fg_dark,
        bg = colors.bg_sidebar,
        blue = colors.blue,
      }

      vim.g["fern#hide_cursor"] = true
      vim.g["fern#renderer"] = "nerdfont"
      vim.g["fern#renderer#nerdfont#indent_markers"] = 1

      vim.api.nvim_create_autocmd("FileType", {
        group = augroup.userftkeymap,
        pattern = "fern",
        callback = function()
          -- Local options
          vim.opt_local.number = false
          vim.opt_local.signcolumn = "no"
          vim.opt_local.foldcolumn = "0"
          -- Glyph palette
          vim.fn["glyph_palette#apply"]()
          -- keymapping
          keys("y", "<Plug>(fern-action-clipboard-copy)")
          keys("m", "<Plug>(fern-action-clipboard-move)")
          keys("P", "<Plug>(fern-action-clipboard-paste)")
          keys("D", "<Plug>(fern-action-remove)")
          keys("r", "<Plug>(fern-action-rename:bottom)")
          keys("x", "<Plug>(fern-action-mark)")
          keys("p", "<Plug>(fern-action-preview:toggle)")
          keys("<C-n>", "<Plug>(fern-action-preview:scroll:down:half)")
          keys("<C-p>", "<Plug>(fern-action-preview:scroll:up:half)")
          keys("<C-r>", "<Plug>(fern-action-reload:all)")
          keys("q", "<Cmd>Fern . -reveal=% -drawer -toggle -width=40<CR>")
        end,
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        group = "FernMyConf",
        callback = function()
          if vim.bo.filetype == "fern" then
            vim.api.nvim_win_set_hl_ns(0, ns)
            vim.api.nvim_set_hl(ns, "FernRootSymbol", { fg = colors.yellow })
            vim.api.nvim_set_hl(ns, "FernRootText", { fg = colors.yellow })
            vim.api.nvim_set_hl(ns, "FernBranchSymbol", { link = "Directory" })
            vim.api.nvim_set_hl(ns, "FernBranchText", { link = "Directory" })
            vim.api.nvim_set_hl(ns, "FernLeafText", { fg = colors.fg })
            vim.api.nvim_set_hl(ns, "Normal", {
              bg = dark_colors.bg,
            })
            vim.api.nvim_set_hl(ns, "FoldColumn", {
              bg = colors.blue,
            })
            vim.api.nvim_set_hl(ns, "EndOfBuffer", {
              fg = dark_colors.bg,
              bg = dark_colors.bg,
            })
          end
        end,
      })

      vim.api.nvim_create_autocmd("BufLeave", {
        group = "FernMyConf",
        callback = function()
          if vim.bo.filetype == "fern" then
            vim.api.nvim_set_hl(ns, "FernRootSymbol", { fg = colors.fg_dark })
            vim.api.nvim_set_hl(ns, "FernRootText", { fg = colors.fg_dark })
            vim.api.nvim_set_hl(ns, "FernBranchSymbol", { fg = colors.fg })
            vim.api.nvim_set_hl(ns, "FernBranchText", { fg = colors.fg })
            vim.api.nvim_set_hl(ns, "FernLeafText", { fg = colors.fg })
            vim.api.nvim_win_set_hl_ns(0, ns)
            vim.api.nvim_set_hl(ns, "Normal", {
              bg = dark_colors.bg,
            })
            vim.api.nvim_set_hl(ns, "EndOfBuffer", {
              fg = dark_colors.bg,
              bg = dark_colors.bg,
            })
          end
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        group = "FernMyConf",
        pattern = "FernHighlight",
        callback = function()
          vim.api.nvim_win_set_hl_ns(0, ns)
          vim.api.nvim_set_hl(ns, "FernBranchSymbol", { link = "Directory" })
          vim.api.nvim_set_hl(ns, "FernBranchText", { link = "Directory" })
          vim.api.nvim_set_hl(ns, "FernRootSymbol", { fg = colors.fg_dark })
          vim.api.nvim_set_hl(ns, "FernRootText", { fg = colors.fg_dark })
        end,
      })
    end,
  },
}
