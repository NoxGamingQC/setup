#!/bin/bash 

noColor='\033[0m'
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'


function chooseSystem() {
    echo "Select your system"
    echo "[0] Ubuntu"
    read -n 1 -s -r -p "" choice
    case $choice in
        0)
	        echo -e "[${cyan}Ubuntu${noColor}] We will now setup your computer."
	        ubuntu
		    ;;
	    *)
	        clear
		    echo -e "${red}ERROR: Invalid option${noColor}"
		    chooseSystem
		    ;;
	    esac
}

function ubuntu() {
    exitScript
}

function exitScript() {
    read -n 1 -s -r -p read -n 1 -s -r -p "Press any key to exit"
    clear
    exit
}

# Main
if [[ $EUID -eq 0 ]]; then
    clear
    chooseSystem
else
    echo -e "${red}ERROR: This script requires root privileges to install apps. Aborting ...${noColor}"
fi


