return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local augroup = require("utils.augroup")
      require("lint").linters_by_ft = {
        bash = { "shellcheck" },
        cpp = { "clangtidy" },
        lua = { "luacheck" },
      }

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = augroup.userFormatting,
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
