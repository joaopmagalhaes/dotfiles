#!/bin/bash

# store the current dir
CUR_DIR=$(pwd)

while true; do
    read -ep "Are you sure you want to continue? (You'll lose any changes you might have!) [Y/n] " yn
    case $yn in
        "")     break;;
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no";;
    esac
done

# Let the person running the script know what's going on.
echo -e "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

# Find all git repositories and update it to the master latest revision
for i in $(find . -maxdepth 2 -name ".git" | cut -c 3-); do
    echo "";
    echo -e "\033[33m"+$i+"\033[0m";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # finally checkout, pull and fetch
    git checkout -- .;
    git checkout master;
    git pull origin master;
    git fetch --all --prune;

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo -e "\n\033[32mComplete!\033[0m\n"
