return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "bash",
        "c",
        "cpp",
        "go",
        "rust",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "bash", "c", "cpp", "lua", "rust" },
        callback = function(args)
          vim.treesitter.start(args.buf)
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("rainbow-delimiters.setup").setup({
        strategy = {
          [""] = "rainbow-delimiters.strategy.global",
          vim = "rainbow-delimiters.strategy.local",
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      })

      local rainbow_colors = {
        RainbowDelimiterRed = "#E8BA36",
        RainbowDelimiterOrange = "#54A857",
        RainbowDelimiterYellow = "#359FF4",
        RainbowDelimiterGreen = "#5060BB",
        RainbowDelimiterCyan = "#179387",
        RainbowDelimiterBlue = "#88C0D0",
        RainbowDelimiterViolet = "#5E81AC",
      }
      for group, color in pairs(rainbow_colors) do
        vim.api.nvim_set_hl(0, group, { fg = color })
      end
    end,
  },
}
