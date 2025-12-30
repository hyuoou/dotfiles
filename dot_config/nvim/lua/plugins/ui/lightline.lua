return {
  {
    "itchyny/lightline.vim",
    lazy = false,
    dependencies = {
      "mengelbrecht/lightline-bufferline",
    },
    init = function()
      vim.g.lightline = {
        enable = {
          statusline = 0,
          tabline = 1,
        },
        colorscheme = "tokyonight",
        separator = { left = "", right = "" },
        subseparator = { left = "", right = "" },
        tabline = {
          left = { { "buffers" } },
          right = { {} },
        },
        component_expand = {
          buffers = "lightline#bufferline#buffers",
        },
        component_type = {
          buffers = "tabsel",
        },
      }

      vim.g['lightline#bufferline#show_number'] = 2
      vim.g['lightline#bufferline#enable_devicons'] = 0
      vim.g['lightline#bufferline#unnamed'] = '[No Name]'
      vim.g['lightline#bufferline#icon_position'] = 'right'
    end,
  },
}
