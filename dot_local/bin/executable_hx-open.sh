#!/usr/bin/env sh

fpath="$1"

if [ -n $fpath ]; then
  zellij action focus-next-pane
	# zellij action toggle-floating-panes
	zellij action write 27 # send <Escape> key
	zellij action write-chars ":o $fpath"
	zellij action write 13 # send <Enter> key
else
	# zellij action toggle-floating-panes
  zellij action focus-next-pane
fi
