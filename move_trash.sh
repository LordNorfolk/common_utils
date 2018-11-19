#! /bin/bash


# This script moves a file to an intermediate trash directory, 
# then gives the user option to deletethe entire intermediate trash 
# directory. The intermediate trash location will be called the 
# 'Trash can' henceforth.

# Check to see if the Trash can exists already, create it otherwise
sh check_trash.sh ~/.local/share/Trash


# Force moves a file (or list of files) or directory to the intermediate trash location, ~/.local/share/Trash
for l in $@; do
	mv -f $l ~/.local/share/Trash
done

# Read the contents of intermediate trash location

echo "Hello there, $USER. Please review the Trash can's contents and determine whether to delete it."
echo "---------------------------"
echo "~/.local/share/Trash"
ls -la ~/.local/share/Trash

echo "---------------------------"
echo "\nWould you like to empty the Trash Can?"

# while loop to prompt user to delete the intermediate trash location
until [[ $usr_input == 'y' || $usr_input == 'n' ]]; do
	echo "Please enter your response, 'y' or 'n' and then press [ENTER]: "
	read usr_input
	
	if [[ $usr_input == 'y' ]]; then
		sh ~/Developing/Local/bash_scripts/empty_trash.sh
		echo "The Trash can has been emptied"

	elif [[ $usr_input == 'n' ]]; then
		echo "You have opted not to empty the trash can."
		echo "Have a nice day! :D"

	else
		echo "That input is incorrect, please try again!\n\n"

	fi

done
