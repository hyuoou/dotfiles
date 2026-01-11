local M = {}
local colors = require("tokyonight.colors").setup()

-- vim-fern
local ns = vim.api.nvim_create_namespace("fern-colors")
local dark_colors = {
  fg = colors.fg_dark,
  bg = colors.bg_sidebar,
  blue = colors.blue,
}

function M.general()
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.fg_dark, bg = "none" })
end

function M.rainbow_delimiters()
  local rainbow_colors = {
    RainbowDelimiterRed = "#E8BA36",
    RainbowDelimiterOrange = "#54A857",
    RainbowDelimiterYellow = "#359FF4",
    RainbowDelimiterGreen = "#5060BB",
    RainbowDelimiterCyan = "#179387",
    RainbowDelimiterBlue = "#88C0D0",
    RainbowDelimiterViolet = "#5E81AC",
  }
  for group, color in pairs(rainbow_colors) do
    vim.api.nvim_set_hl(0, group, { fg = color })
  end
end

function M.nvim_cmp()
  -- Customization for Pmenu
  -- Popup menu
  vim.api.nvim_set_hl(0, "Pmenu", { fg = "#c0caf5", bg = "#16161e" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#292e42", fg = "NONE" })

  -- Abbreviation & menu
  vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#565f89", bg = "NONE", strikethrough = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#7aa2f7", bg = "NONE", bold = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#7aa2f7", bg = "NONE", bold = true })
  vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#bb9af7", bg = "NONE", italic = true })

  -- Kinds
  vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#1a1b26", bg = "#e0af68" })
  vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#1a1b26", bg = "#e0af68" })
  vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#1a1b26", bg = "#e0af68" })

  vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#1a1b26", bg = "#9ece6a" })
  vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#1a1b26", bg = "#9ece6a" })
  vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#1a1b26", bg = "#9ece6a" })

  vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#1a1b26", bg = "#e0af68" })
  vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#1a1b26", bg = "#e0af68" })
  vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#1a1b26", bg = "#e0af68" })

  vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#1a1b26", bg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#1a1b26", bg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#1a1b26", bg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#1a1b26", bg = "#7aa2f7" })
  vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#1a1b26", bg = "#7aa2f7" })

  vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#1a1b26", bg = "#565f89" })
  vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#1a1b26", bg = "#565f89" })

  vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#1a1b26", bg = "#e0af68" })
  vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#1a1b26", bg = "#e0af68" })
  vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#1a1b26", bg = "#e0af68" })

  vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#1a1b26", bg = "#7dcfff" })
  vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#1a1b26", bg = "#7dcfff" })
  vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#1a1b26", bg = "#7dcfff" })

  vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#1a1b26", bg = "#7dcfff" })
  vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#1a1b26", bg = "#7dcfff" })
  vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#1a1b26", bg = "#7dcfff" })
end

function M.fern_bufenter()
  if vim.bo.filetype == "fern" then
    vim.api.nvim_win_set_hl_ns(0, ns)
    vim.api.nvim_set_hl(ns, "FernRootSymbol", { fg = colors.yellow })
    vim.api.nvim_set_hl(ns, "FernRootText", { fg = colors.yellow })
    vim.api.nvim_set_hl(ns, "FernBranchSymbol", { link = "Directory" })
    vim.api.nvim_set_hl(ns, "FernBranchText", { link = "Directory" })
    vim.api.nvim_set_hl(ns, "FernLeafText", { fg = colors.fg })
    vim.api.nvim_set_hl(ns, "Normal", {
      bg = dark_colors.bg,
    })
    vim.api.nvim_set_hl(ns, "FoldColumn", {
      bg = colors.blue,
    })
    vim.api.nvim_set_hl(ns, "EndOfBuffer", {
      fg = dark_colors.bg,
      bg = dark_colors.bg,
    })
    vim.api.nvim_set_hl(ns, "CursorLine", {
      fg = colors.fg,
      bg = colors.blue7,
    })
  end
end

function M.fern_bufleave()
  if vim.bo.filetype == "fern" then
    vim.api.nvim_set_hl(ns, "FernRootSymbol", { fg = colors.fg_dark })
    vim.api.nvim_set_hl(ns, "FernRootText", { fg = colors.fg_dark })
    vim.api.nvim_set_hl(ns, "FernBranchSymbol", { link = "Directory" })
    vim.api.nvim_set_hl(ns, "FernBranchText", { link = "Directory" })
    vim.api.nvim_set_hl(ns, "FernLeafText", { fg = colors.fg })
    vim.api.nvim_win_set_hl_ns(0, ns)
    vim.api.nvim_set_hl(ns, "Normal", {
      bg = dark_colors.bg,
    })
    vim.api.nvim_set_hl(ns, "EndOfBuffer", {
      fg = dark_colors.bg,
      bg = dark_colors.bg,
    })
    vim.api.nvim_set_hl(ns, "CursorLine", {
      fg = colors.fg,
      bg = colors.blue7,
    })
  end
end

function M.fern_user()
  vim.api.nvim_win_set_hl_ns(0, ns)
  vim.api.nvim_set_hl(ns, "FernBranchSymbol", { link = "Directory" })
  vim.api.nvim_set_hl(ns, "FernBranchText", { link = "Directory" })
  vim.api.nvim_set_hl(ns, "FernRootSymbol", { fg = colors.fg_dark })
  vim.api.nvim_set_hl(ns, "FernRootText", { fg = colors.fg_dark })
  vim.api.nvim_set_hl(ns, "CursorLine", {
    fg = colors.fg,
    bg = colors.blue7,
  })
end

local function apply_all()
  M.general()
  M.rainbow_delimiters()
  M.nvim_cmp()
end

function M.setup()
  local group = vim.api.nvim_create_augroup("MyHighlights", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = function()
      apply_all()
    end,
  })
  apply_all()
end

return M
