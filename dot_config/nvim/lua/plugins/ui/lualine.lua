return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local function lsp_status()
        local buf_clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
        if next(buf_clients) == nil then
          return "No LSP"
        end

        local names = {}
        for _, client in ipairs(buf_clients) do
          table.insert(names, client.name)
        end

        return table.concat(names, ", ")
      end

      require("lualine").setup({
        options = {
          icons_enabled = false,
          theme = "tokyonight",
        },
        sections = {
          lualine_b = {
            "filename",
            { "branch", icons_enabled = true },
            "diff",
          },
          lualine_c = { "diagnostics" },
          lualine_x = { lsp_status, "fileformat", "encoding", "filetype" },
          lualine_y = { "location", "progress" },
          lualine_z = {},
        },
      })
    end,
  },
}
