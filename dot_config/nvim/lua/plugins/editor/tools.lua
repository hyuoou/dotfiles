return {
  {
    "mattn/vim-sonictemplate",
    cmd = "Template",
    config = function()
      vim.g.sonictemplate_vim_template_dir = vim.fn.stdpath("config") .. "/template"
    end,
  },

  {
    "vim-jp/vimdoc-ja",
    event = "VeryLazy",
    config = function()
      vim.opt.helplang = "ja"
    end,
  },

  {
    "brenoprata10/nvim-highlight-colors",
    cmd = { "HighlightColorsOn" },
    opts = {},
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "VeryLazy" },
    main = "ibl",
    opts = { scope = { enabled = false } },
  },

  {
    "famiu/bufdelete.nvim",
    dependencies = {
      "kana/vim-altercmd",
    },
    event = { "VeryLazy" },
    config = function()
      vim.cmd([[
        call altercmd#load()
        AlterCommand bd Bd
        AlterCommand bdelete Bdelete
      ]])
    end,
  },

  {
    "Bekaboo/dropbar.nvim",
    event = { "VeryLazy" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "stevearc/dressing.nvim",
    event = { "VeryLazy" },
    opts = {},
  },
}
