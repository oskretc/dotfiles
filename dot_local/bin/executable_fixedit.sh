#!/bin/bash

# This script reads text from standard input, filters for lines containing
# "Could not fix file:", extracts the last word (the file path),
# and presents them in fzf to be opened in the Helix editor.

# Read from standard input, which is the output piped from the previous command.
cat | \
  grep "Could not fix file:" | \
  awk '{print $NF}' | \
  fzf --multi --preview 'bat --color=always --style=numbers {}' | \
  xargs -r hx

echo "Script finished."
