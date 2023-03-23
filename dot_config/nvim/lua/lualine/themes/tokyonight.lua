local colors = require("tokyonight.colors").setup({ transform = true })
local config = require("tokyonight.config").options

local tokyonight = {}

tokyonight.normal = {
  a = { bg = colors.blue, fg = colors.black, gui = "bold" },
  b = { bg = colors.fg_gutter, fg = colors.blue },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

tokyonight.insert = {
  a = { bg = colors.green, fg = colors.black, gui = "bold" },
  b = { bg = colors.fg_gutter, fg = colors.blue },
}

tokyonight.command = {
  a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
  b = { bg = colors.fg_gutter, fg = colors.blue },
}

tokyonight.visual = {
  a = { bg = colors.magenta, fg = colors.black, gui = "bold" },
  b = { bg = colors.fg_gutter, fg = colors.blue },
}

tokyonight.replace = {
  a = { bg = colors.red, fg = colors.black, gui = "bold" },
  b = { bg = colors.fg_gutter, fg = colors.blue },
}

tokyonight.terminal = {
  a = { bg = colors.green1, fg = colors.black, gui = "bold" },
  b = { bg = colors.fg_gutter, fg = colors.blue },
}

tokyonight.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

if config.lualine_bold then
  for _, mode in pairs(tokyonight) do
    mode.a.gui = "bold"
  end
end

return tokyonight
