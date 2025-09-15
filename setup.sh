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
    echo "Do you want to use your computer to code? (y/n)"
    read -n 1 -s -r installCode
    if [[ "$installCode" == "y" || "$installCode" == "Y" ]]; then
        
        exitScript
    else
        exitScript
    fi
}

function exitScript() {
    read -n 1 -s -r -p read -n 1 -s -r -p "Press any key to exit"
    clear
    exit
}

# Main
if [[ $EUID -eq 0 ]]; then
    clear
    echo "Hey, so how this script work, select Y or y to install the requested packages. Any invalid answer will result to not installing the packages. You can rerun the script to install the missing packages. To uninstall a list of package are available in our readme."
    echo ""
    chooseSystem
else
    echo -e "${red}ERROR: This script requires root privileges. Aborting ...${noColor}"
fi


