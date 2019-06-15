#!/bin/bash

# Get the arguments
# Check if an argument is passed
if [ $# -eq 0 ]
then
    echo "No args supplied!" 2>&1
    exit 2
fi

# Set up the args

# Format title: make lowercase and subst spaces with dashes
TITLE=$1
TITLE=`echo $TITLE | awk '{print tolower($0)}'` # make lowercase
TITLE=`echo $TITLE | tr " " -`

TODAY=`date +%Y-%m-%d`
TIME_NOW=`date '+%Y-%m-%d %H:%M:%S %z'`
FILE_NAME="$TODAY-$TITLE.markdown"

# Create file
touch $FILE_NAME

# Fill it in with post data 
# Make sure to enable backslash escapes interpretation with -e flag
printf  '%s\n' \
        "---" \
        "layout: post" \
        "title: $TITLE" \
        "date: $TIME_NOW" \
        "categories: jekyll update" \
        "---" \
        > "$FILE_NAME"
