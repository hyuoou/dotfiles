local wezterm = require("wezterm")
local config = wezterm.config_builder()
local triple = wezterm.target_triple

-- 1. フォント設定
config.font = wezterm.font_with_fallback({
  { family = "FiraCode Nerd Font", weight = "Medium" },
  { family = "IBM Plex Sans JP", weight = "Medium" },
  { family = "IBM Plex Sans SC", weight = "Medium" },
  { family = "IBM Plex Sans KR", weight = "Medium" },
})
if triple:find("linux") then
  config.font_size = 10.0
else
  config.font_size = 12.0
end

-- 2. 色の設定 (TokyoNight Night)
config.colors = {
  foreground = "#c0caf5",
  background = "#1a1b26",
  cursor_bg = "#c0caf5",
  cursor_fg = "#1a1b26",
  selection_bg = "#33467c",
  selection_fg = "#c0caf5",
  ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
  brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
  indexed = { [16] = "#ff9e64", [17] = "#db4b4b" },
}

-- 3. 壁紙があるなら上書き
local wallpaper = wezterm.home_dir .. "/Pictures/lonetrail.png"
local function file_exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
    return true
  end
  return false
end

if file_exists(wallpaper) then
  config.background = {
    {
      source = {
        File = wallpaper,
      },
      hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 0.05,
      },
    },
  }
end

-- 4. レイアウト・隙間の徹底排除
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.enable_scroll_bar = false -- 右端の隙間の原因を消す
config.use_resize_increments = true -- ウィンドウサイズを文字単位に強制し、端の余りを防ぐ

-- 5. タブバーの設定
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- 6. その他互換設定
config.set_environment_variables = { TERM = "xterm-256color" }
config.default_prog = { "/usr/bin/env", "zsh", "--login" }
config.term = "xterm-256color"

return config
