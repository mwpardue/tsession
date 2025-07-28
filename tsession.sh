#!/bin/bash

header="TMUX Session Manager"
FMENU=(
  fzf
  --tmux 30%,30%
  --header="$header"
  --layout=reverse
  --border=bold
  --border=rounded
  --margin=5%
  --multi
  --color=dark
  --info=hidden
  --header-first
  --bind change:top
  --prompt
)

selected_row=$(tmux list-sessions | awk -F : '{print $1}' | "${FMENU[@]}" "Select session: ")
if [[ -n "$selected_row" ]]; then

  tmux switch-client -t $selected_row

fi
