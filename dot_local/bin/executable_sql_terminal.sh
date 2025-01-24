#!/bin/bash

file="/tmp/hextemp.tmp"
touch $file

zellij run -c -n helix --direction down -- bash sql_editor.sh $3
zellij action move-pane up

zellij action resize increase up
zellij action resize increase up
zellij action resize increase up
zellij action resize increase up
# while [ -e "$file" ]; do
#   sleep 1 # Wait for 1 second before checking again
# done





