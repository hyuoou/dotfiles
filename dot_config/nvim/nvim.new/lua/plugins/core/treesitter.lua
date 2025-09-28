return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- lazy = false,
    event = { "BufRead", "BufNewFile" },
    branch = "master",
    build = ":TSUpdate",
    dependencies = {
      "HiPhish/rainbow-delimiters.nvim"
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_install = { "c", "cpp", "rust" },
        auto_install = true,
        highlight = {
          enable = true,
        }
      })
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    config = function()
      local rainbow_delimiters = require('rainbow-delimiters')

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
      vim.cmd([[
        highlight RainbowDelimiterRed guifg=#E8BA36
        highlight RainbowDelimiterOrange guifg=#54A857
        highlight RainbowDelimiterYellow guifg=#359FF4
        highlight RainbowDelimiterGreen guifg=#5060BB
        highlight RainbowDelimiterCyan guifg=#179387
        highlight RainbowDelimiterBlue guifg=#88C0D0
        highlight RainbowDelimiterViolet guifg=#5E81AC
      ]])
    end,
  }
}
