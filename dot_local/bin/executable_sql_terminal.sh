#!/bin/bash

file="/tmp/hextemp.tmp"
touch $file

zellij run -fc -- bash sql_editor.sh $3

while [ -e "$file" ]; do
  sleep 1 # Wait for 1 second before checking again
done





