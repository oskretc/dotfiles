#!/usr/bin/env bash

# when helix supports passing the name of the file
if [ $# -eq 1 ]; then
	cp $1 lazysql.sql
fi


zellij action focus-previous-pane

	zellij action write  27  # send <Escape> key
	# zellij action write 6
	zellij action write 5   #sends Ctrl+e to focus on editor
	zellij action write 27 79 81  # sends F2 to trigger reload of temp file and save
	# 
	# zellij action write 13 # send <Enter> key

zellij action focus-next-pane
