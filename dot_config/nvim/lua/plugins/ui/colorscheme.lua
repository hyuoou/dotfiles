return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local tokyonight = require("tokyonight")
      local colors = require("tokyonight.colors").setup({
        transform = true,
        on_colors = function(_) end,
        on_highlights = function(_) end,
      })
      local isTransparent = true
      local opts = {
        style = "night",
        transparent = isTransparent,
        on_colors = function(_) end,
        on_highlights = function(hl, c)
          local prompt = "#2d3149"
          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = colors.magenta,
            fg = colors.black,
          }
          hl.TelescopePreviewTitle = {
            bg = colors.blue,
            fg = colors.black,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
      }

      tokyonight.setup(opts)
      vim.cmd.colorscheme("tokyonight")
      require("config.highlights").setup()

      vim.api.nvim_create_user_command("EnableTransparent", function()
        isTransparent = true
        opts.transparent = isTransparent
        tokyonight.setup(opts)
        vim.cmd.colorscheme("tokyonight")
      end, {})

      vim.api.nvim_create_user_command("DisableTransparent", function()
        isTransparent = false
        opts.transparent = isTransparent
        tokyonight.setup(opts)
        vim.cmd.colorscheme("tokyonight")
      end, {})

      vim.api.nvim_create_user_command("ToggleTransparent", function()
        isTransparent = not isTransparent
        opts.transparent = isTransparent
        tokyonight.setup(opts)
        vim.cmd.colorscheme("tokyonight")
      end, {})
    end,
  },
}
