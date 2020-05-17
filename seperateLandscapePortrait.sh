#!/bin/sh
# Seperates pictures into landscape or portrait folders
#set -x
if [ "$#" -ne 1 ]; then
    folder=$(pwd)
else
    folder=$1
fi
echo "Processing $folder"
cd "$folder"
mkdir -p landscape
mkdir -p portrait
for file in *
do
    if [ -f "$file" ]; then
        if [ `identify -format '%w %h' $file | awk '$1 / $2 > 1 {printf "LANDSCAPE"} $1 / $2 <= 1 {printf "PORTRAIT"}'` == "LANDSCAPE" ]; then
            mv "$file" landscape
        else
            mv "$file" portrait
        fi
    fi
done
