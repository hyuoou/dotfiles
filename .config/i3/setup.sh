#!/usr/bin/env bash

set -eu

i3-msg workspace "6: "
i3-msg exec biscuit
sleep 1
i3-msg exec keepassxc
sleep 1

i3-msg workspace "5: "
i3-msg exec spotify
sleep 1

i3-msg workspace "4: "
i3-msg exec 'firefox --new-window'

i3-msg workspace "6: "
i3-msg workspace "4: "

