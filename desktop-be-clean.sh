#!/bin/bash

current_date=$(date +"%Y-%m-%d")
new_directory="$HOME/Desktop-${current_date}"
step_through="n"

# Check for the -s option to step through each file and directory
while [[ $# -gt 0 ]]; do
  case $1 in
    -s|--step)
      step_through="y"
      shift # move past argument
      ;;
    *)
      # Handle unknown option
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# If the -s option is not passed, ask the user if they want to proceed
if [ $step_through == "n" ]; then
  echo "This script will move all files and directories on the Desktop to a new directory named Desktop-${current_date}"
  echo "Do you want to proceed? [y/n]: "
  read -r proceed
fi

echo "Starting to move files and directories"

# Create the new directory
mkdir "$new_directory"

# Move all files and directories on the Desktop to the new directory
for file in "$HOME"/Desktop/*; do
  echo "Moving [ $file ] to [ $HOME/Desktop-${current_date} ]"
    filename=$(basename "$file")
    # if the -s option is passed, step through each file and directory
    if [ "$step_through" == "y" ]; then
      printf "Proceed? [y/n]: "
      read -r proceed
      # if the user does not want to proceed, skip the file
      if [ "$proceed" == "y" ]; then
        mv "$file" "$new_directory/$filename"
      else
        echo "Skipping [ $file ]"
      fi
    else
      mv "$file" "$new_directory/$filename"
    fi
done