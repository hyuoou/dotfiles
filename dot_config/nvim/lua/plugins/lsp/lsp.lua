return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    event = "VeryLazy",
    config = function()
      local servers = { "bashls", "clangd", "lua_ls", "rust_analyzer" }
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
        ensure_installed = servers,
      })

      vim.keymap.set("n", "<C-h>", function()
        vim.diagnostic.jump({ count = 1 })
      end, { silent = true })
      vim.keymap.set("n", "<C-l>", function()
        vim.diagnostic.jump({ count = -1 })
      end, { silent = true })
      vim.keymap.set("n", "ge", vim.lsp.buf.definition, { silent = true })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { silent = true })

      vim.api.nvim_create_user_command(
        "LspLinesToggle",
        'lua require("lsp_lines").toggle({ desc = "Toggle lsp_lines" })',
        {}
      )
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = true,
      })

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- vim.lsp.enable(servers)
      vim.lsp.enable("sourcekit")
    end,
  },

  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = { "LspAttach" },
    opts = {},
  },
}
