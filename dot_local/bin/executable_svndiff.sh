#!/bin/bash

 # svn diff --diff-cmd colordiff $(svn status |fzf --preview 'bat --color=always {2}' --preview-window 'up,50%,border-bottom,+{2}+3/3,~3' --bind 'enter:become(echo {2})') | delta


# Get the list of changed files from svn diff
files=$(svn diff --summarize | awk '{print $2}')

# Use fzf to allow the user to select files
selected_files=$(echo "$files" | fzf --multi --preview 'bat --color=always {1}' --preview-window 'up,50%' )

# If no files are selected, exit
if [[ -z "$selected_files" ]]; then
  echo "No files selected."
  exit 0
fi

# Iterate over the selected files and run svn diff
for file in $selected_files; do
  svn diff --diff-cmd colordiff "$file" | delta
done
