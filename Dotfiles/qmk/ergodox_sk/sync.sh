#!/usr/bin/env bash

QMK_FOLDER=~/Documents/Code/Utils/QMK\ Firmware/
KEYMAP_FOLDER=$QMK_FOLDER/keyboards/ergodox/keymaps/sk/
DOT_FOLDER=~/Documents/Code/Dotfiles/qmk/ergodox_sk/

unison "$KEYMAP_FOLDER" "$DOT_FOLDER"
