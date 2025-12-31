return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lint").linters_by_ft = {
        bash = { "shellcheck" },
        cpp = { "clangtidy" },
        lua = { "luacheck" },
      }

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        pattern = "*",
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
