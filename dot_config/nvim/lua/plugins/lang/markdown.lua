return {
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
    config = function()
      require("markview").setup({
        preview = { enable = false },
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown" },
        callback = function()
          vim.opt_local.wrap = false
        end,
      })
    end,
  },
}
