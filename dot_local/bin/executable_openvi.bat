@echo off
fd --type f --strip-cwd-prefix | fzf | xargs start 
