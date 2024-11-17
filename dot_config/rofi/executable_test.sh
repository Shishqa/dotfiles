#!/usr/bin/env sh

# List projects if no arguments given
if [ -z "$1" ]; then
    echo ""
else
    xdg-open "https://www.google.com/search?q=$1"
fi
