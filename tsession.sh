#!/bin/bash

FMENU=(
  fzf
  --tmux 15%,15%
  --layout=reverse
  --border=bold
  --border=rounded
  --border-label="TMUX Session Manager"
  --border-label-pos=center
  --margin=2%
  --color 'fg:7'
  --color 'current-fg:13'
  --color 'current-bg:-1'
  --color 'pointer:6'
  --color 'hl:13'
  --color 'border:6'
  --color 'label:13'
  --color 'header:7'
  --color 'prompt:7'
  --info=hidden
  --header-first
  --bind change:top
  --prompt
)

current_session=$(tmux display-message -p '#S')

selected_row=$(tmux list-sessions | grep -v attached | awk -F : '{print $1}' | "${FMENU[@]}" "Select session [${current_session}]: ")
if [[ -n "$selected_row" ]]; then

  tmux switch-client -t $selected_row

fi
