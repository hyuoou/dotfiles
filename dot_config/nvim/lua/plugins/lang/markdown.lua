return {
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    config = function()
      require("markview").setup({
        preview = { enable = false },
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "vim-tree/nvim-web-devicons",
    },
    opts = {},
  },

  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    cmd = { "Obsidian" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Obsidian",
          path = "$HOME/Documents/Obsidian",
        },
      },
      daily_notes = {
        folder = "Daily",
      },
      legacy_commands = false,
    },
  },
}
