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


function displayTitle () {
    cat << "EOF"
 _______________________________________________________________
|                                                               |
|    _____      _                 _____           _       _     |
|   / ____|    | |               / ____|         (_)     | |    |
|  | (___   ___| |_ _   _ _ __  | (___   ___ _ __ _ _ __ | |_   |
|   \___ \ / _ \ __| | | | '_ \  \___ \ / __| '__| | '_ \| __|  |
|   ____) |  __/ |_| |_| | |_) | ____) | (__| |  | | |_) | |_   |
|  |_____/ \___|\__|\__,_| .__/ |_____/ \___|_|  |_| .__/ \__|  |
|                       | |                        | |          |
|                       |_|                        |_|          |
|                                                               |
|_______________________________________________________________|
EOF
    
    echo -e "\n\n${blue}[*] ${yellow}J.Bédard Tech Services                   ${blue}[*]${noColor}"
    echo -e "${blue}[*] ${green}Version: 1.0                             ${blue}[*]${noColor}"
    echo -e "${blue}[*] ${green}Bug report: ${cyan}github.com/NoxGamingQC/setup ${blue}[*]${noColor}"
    echo -e "${blue}[*] ${green}Created By: ${cyan}Jimmy Béland-Bédard          ${blue}[*]${noColor}"
    echo -e "${blue}[*] ${green}Developper: ${cyan}Jimmy Béland-Bédard          ${blue}[*]${noColor}"
    echo -e "\n\n\n"
}

function chooseSystem() {
    echo "Select your system"
    echo "[0] Ubuntu"
    read -n 1 -s -r -p "" choice
    case $choice in
        0)
            clear
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
        echo -e "${yellow}Installing Visual Studio Code ...${noColor}"
        sudo snap install --classic code
        echo -e "${green}Completed.${noColor}"
    fi
    echo -e "${green}Setup completed.${noColor}"
    exitScript
}

function exitScript() {
    read -n 1 -s -r -p read -n 1 -s -r -p "Press any key to exit"
    clear
    echo ""
    echo -e "======== ${cyan}You can now exit the terminal.${noColor} ========="
    echo ""
    exit
}

############################################################################
## MAIN FUNCTION                                                          ##
## The part below allows you to setup your computer while following some  ##
## order.                                                                 ##
############################################################################

echo -ne '\033]0;Setup script - J.Bédard Tech Services\007'
if [[ $EUID -eq 0 ]]; then
    clear
    displayTitle
    chooseSystem
else
    clear
    echo -e "${red}ERROR: This script requires root privileges. Aborting ...${noColor}"
fi


