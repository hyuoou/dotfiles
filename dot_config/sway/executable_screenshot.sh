#!/usr/bin/env bash

# 保存先
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

# 日付フォーマット
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

# モード判定とファイル名の接頭辞設定
case $1 in
  "window")
    PREFIX="grim_window_"
    GEOM=$(swaymsg -t get_tree | jq -r '.. | select(.focused? == true) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
    ;;
  "area")
    PREFIX="grim_area_"
    GEOM=$(slurp)
    # slurpがキャンセルされた(Escなど)場合は終了
    if [ -z "$GEOM" ]; then exit 1; fi
    ;;
  *)
    PREFIX="grim_"
    GEOM=""
    ;;
esac

# 最終的な保存パス
FILE="$DIR/${PREFIX}${TIMESTAMP}.png"

# 実行
if [ -z "$GEOM" ]; then
    # 全体撮影
    grim - | tee "$FILE" | wl-copy
else
    # 範囲・ウィンドウ撮影
    grim -g "$GEOM" - | tee "$FILE" | wl-copy
fi

# 成功したら通知
if [ $? -eq 0 ]; then
    notify-send "Screenshot Captured" "Saved as ${PREFIX}${TIMESTAMP}.png" -i "$FILE"
fi
