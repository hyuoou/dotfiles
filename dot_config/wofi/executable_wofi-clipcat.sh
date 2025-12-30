#!/bin/bash

# 1. 履歴リストを取得して wofi で選択
# -F はフィールド区切り文字を指定。コロンとスペースで区切られた最初の要素を取得
SELECTED=$(clipcatctl list | wofi --dmenu -p "Clipboard")

# 選択されなかった場合は終了
if [ -z "$SELECTED" ]; then
    exit 0
fi

# 2. IDを取得
# コロン(:)を区切り文字として使い、最初のフィールドを取り出す
ID=$(echo "$SELECTED" | awk -F ':' '{print $1}')

# 3. clipcat から中身を取得してクリップボードへ
# clipcatctl get にIDを渡して取得した内容を wl-copy でクリップボードに送る
clipcatctl get "$ID" | wl-copy
