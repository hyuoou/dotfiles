return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    cmd = { "Mason" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("lspconfig.ui.windows").default_options.border = "single"
      require("mason").setup({
        ui = {
          border = "single",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = { "bashls", "clangd", "gopls", "rust_analyzer" },
      })

      vim.keymap.set("n", "<C-h>", vim.diagnostic.goto_prev, { silent = true })
      vim.keymap.set("n", "<C-l>", vim.diagnostic.goto_next, { silent = true })
      vim.keymap.set("n", "ge", vim.lsp.buf.definition, { silent = true })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })
      vim.keymap.set("n", "<Space>r", vim.lsp.buf.rename, { silent = true })
    end,
  },

  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = { "LspAttach" },
    config = function()
      vim.api.nvim_create_user_command(
        "LspLinesToggle",
        'lua require("lsp_lines").toggle({ desc = "Toggle lsp_lines" })',
        {}
      )
      require("lsp_lines").setup()
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = true,
      })
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = { "LspAttach" },
    opts = {},
  },
}
