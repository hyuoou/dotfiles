local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 1. フォント設定 (MediumでAlacrittyのRegular相当)
config.font = wezterm.font_with_fallback({
  { family = "SauceCodePro Nerd Font", weight = "Medium" },
  { family = "IBM Plex Sans JP", weight = "Medium" },
  { family = "IBM Plex Sans SC", weight = "Medium" },
  { family = "IBM Plex Sans KR", weight = "Medium" },
})
config.font_size = 10.0

-- 2. 色の設定 (Alacrittyのtomlから移植)
config.colors = {
  foreground = "#c0caf5",
  background = "#1a1b26",
  cursor_bg = "#c0caf5",
  cursor_fg = "#1a1b26",
  selection_bg = "#33467c", -- TokyoNightの標準的な選択色
  selection_fg = "#c0caf5",
  ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
  brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
  indexed = { [16] = "#ff9e64", [17] = "#db4b4b" },
}

-- 3. レイアウト・隙間の徹底排除
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.enable_scroll_bar = false -- 右端の隙間の原因を消す
config.use_resize_increments = true -- ウィンドウサイズを文字単位に強制し、端の余りを防ぐ

-- 4. タブバーの設定 (Alacrittyにはないので、消すか最小限に)
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- 5. その他Alacritty互換設定
config.set_environment_variables = { TERM = "xterm-256color" }
config.default_prog = { "/bin/zsh" }

config.term = "xterm-256color"

return config
