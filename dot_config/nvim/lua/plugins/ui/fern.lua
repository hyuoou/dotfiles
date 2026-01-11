return {
  {
    "lambdalisue/vim-fern",
    keys = {
      { "sf", "<Cmd>Fern .<CR>" },
      { "<leader>f", "<Cmd>Fern . -reveal=% -drawer -toggle -width=40<CR><CR>" },
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
          require("config.highlights").fern_bufenter()
        end,
      })

      vim.api.nvim_create_autocmd("BufLeave", {
        group = "FernMyConf",
        callback = function()
          require("config.highlights").fern_bufleave()
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        group = "FernMyConf",
        pattern = "FernHighlight",
        callback = function()
          require("config.highlights").fern_user()
        end,
      })
    end,
  },
}
