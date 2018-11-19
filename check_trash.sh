#! /bin/bash

# Check if a directory exists. If it doesn't, create it.

#dir="/Users/db/.local/share/NotTrash"
dir=$1

if [ -d "$dir" ]
then
 echo "Congratulations! $dir already exists"
else
 echo "Error: $dir does not not exist, please wait while I create this directory."
 mkdir -p -- "$dir"
 echo "\nDirectory $dir created successfully, thank you for waiting."
fi
