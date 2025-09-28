return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
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
        lualine_x = { "fileformat", "encoding", "filetype" },
        lualine_y = { "location", "progress" },
        lualine_z = {},
      },
    },
  }
}
