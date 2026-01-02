return {
  {
    "stevearc/conform.nvim",
    event = { "BufRead", "BufNewFile" },
    cmd = { "ConformInfo" },
    config = function()
      local augroup = require("utils.augroup")
      require("conform").setup({
        formatters_by_ft = {
          c = { "clang_format" },
          cpp = { "clang_format" },
          lua = { "stylua" },
          rust = { "rustfmt" },
          sh = { "shfmt" },
          zsh = { "beautysh" },
        },
        formatters = {
          beautysh = {
            prepend_args = { "-i", "2" },
          },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup.userFormatting,
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
