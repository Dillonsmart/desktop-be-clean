#!/bin/bash

current_date=$(date +"%Y-%m-%d")
new_directory="$HOME/Desktop-${current_date}"

printf "All files and directories will be moved to %s \n" "$new_directory"
printf "Proceed? [y/n]: "
read -r proceed

case "$proceed" in
	[yY])
		echo "Starting to move files and directories"
    # Create the new directory
	  mkdir "$new_directory"
	      # Move all files and directories on the Desktop to the new directory
		for file in "$HOME"/Desktop/*; do
			echo "Moving [ $file ] to [ $HOME/Desktop-${current_date} ]"
				filename=$(basename "$file")
				mv "$file" "$new_directory/$filename"
		done
		;;
	*)
		echo "No files or directories were moved"
		exit 1
		;;
esac		
