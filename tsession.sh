#!/bin/bash

FMENU=(
  fzf
  --tmux 20%,20%
  --layout=reverse
  --border=bold
  --border=rounded
  --border-label="TMUX Session Manager"
  --border-label-pos=center
  --margin=5%
  --multi
  --color 'fg:#ffffff'
  --color 'current-fg:13'
  --color 'current-bg:-1'
  --color 'pointer:13'
  --color 'hl:13'
  --color 'border:6'
  --color 'header:6'
  --info=hidden
  --header-first
  --bind change:top
  --prompt
)

selected_row=$(tmux list-sessions | awk -F : '{print $1}' | "${FMENU[@]}" "Select session: ")
if [[ -n "$selected_row" ]]; then

  tmux switch-client -t $selected_row

fi
