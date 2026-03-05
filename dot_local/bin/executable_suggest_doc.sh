#!/bin/bash

# Check if both arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <workspace> <file_path> <line_number>"
    exit 1
fi
WORKSPACE=$1
FILE_PATH=$2
LINE_NUMBER=$3

# Execute the agent command
# We use the arguments to populate the prompt dynamically
agent -p --workspace $WORKSPACE "file: $FILE_PATH line:$LINE_NUMBER, suggest a documentation comment for the function referred in the file and line provided, return no formatting only text, the only allowed formatting is // to signify a comment and split lines longer than 80 char, this output will be automatically added to the code"
