return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    opts = {},
  },

  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "kevinhwang91/nvim-hlslens",
      "lewis6991/gitsigns.nvim",
    },
    event = { "VeryLazy" },
    config = function()
      local colors = require('tokyonight.colors').setup()
      require('scrollbar').setup({
        handle = {
          color = colors.bg_highlight,
        },
        marks = {
          Cursor = { text = "-" },
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        },
        excluded_filetypes = {
          "prompt",
          "TelescopePrompt",
          "noice",
          "fern",
          "cmp_menu",
          "cmp_docs",
        },
      })
      require('scrollbar.handlers.search').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end,
  },
}
