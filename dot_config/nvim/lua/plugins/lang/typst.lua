return {
  -- {
  --   "chomosuke/typst-preview.nvim",
  --   ft = "typst",
  --   version = "1.*",
  --   opts = {},
  -- },

  {
    "kaarmu/typst.vim",
    ft = "typst",
    config = function()
      vim.g.typst_pdf_viewer = "zathura"
    end,
  },
}
