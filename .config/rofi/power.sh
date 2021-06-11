#!/usr/bin/env bash

declare -A menu_list=(
  ["Cancel"]=""
  ["Shutdown"]="systemctl poweroff"
  ["Reboot"]="systemctl reboot"
  ["Suspend"]="systemctl suspend"
  ["Lock Screen"]="blurlock"
  ["Logout"]="i3-msg exit"
)


function main() {
  local -r IFS=$'\n'
  [[ "${#}" -ne 0 ]] && eval "${menu_list[$1]}" || echo "${!menu_list[*]}"
}

main "${@}"
