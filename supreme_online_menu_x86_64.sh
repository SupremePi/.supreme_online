#!/bin/bash
# SUPREME ULTRA
# The Supreme Team https://github.com/SupremePi/

sb_version="Supreme Online x86_64"

################
#SUPREME ONLINE#
################

infobox=""
infobox="${infobox}\n"
infobox="${infobox}SUPREME NEWS! TEAM SPLIT.\n"
infobox="${infobox}\n"
infobox="${infobox}PLEASE UNFOLLOW THE SUPREME RETRO GAMING YOUTUBE AND PATREON THIS IS NOT US.\n"
infobox="${infobox}\n"
infobox="${infobox}This Menu Will Let You Fully Restore Or Update Your Build!.\n"
infobox="${infobox}\n"
infobox="${infobox}This Can Happen By Basic User Updates Or Manual Changes.\n"
infobox="${infobox}\n"
infobox="${infobox}We Will Use Descriptive Options For Easy Reference!\n"
infobox="${infobox}\n"
infobox="${infobox}SUPREME ULTRA\n" 
             
dialog --backtitle "SUPREME ONLINE x86_64" \
--title "Supreme Online & More!!!" \
--msgbox "${infobox}" 35 110

function main_menu() {
    local choice
	
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " SUPREME - ONLINE " \
            --ok-label OK --cancel-label Exit \
            --menu "$sb_version" 25 75 20 \
            - "*** AVAILABLE ONLINE SELECTIONS ***" \
            - "" \
	    1 " -  CHECK FOR UPDATES" \
	    - "" \
	    2 " -  x86_64 INSTALLERS" \
	    3 " -  SUPREME RETROPIE SETUP SWAP" \
                - "" \
            4 " -  POWER OFF PI" \
            5 " -  RESTART PI" \
	        - "" \
	    6 " -  SUPREME CREDITS" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) supreme_updates  ;;
	    2) orange_pi_installers  ;;
	    3) supreme_setup  ;;
	    4) supreme_off  ;;			
            5) supreme_restart  ;;
	    6) supreme_credits  ;;
            -) none ;;
            *)  break ;;
        esac
    done
	clear
}

function supreme_updates() {
    echo -e "$(tput setaf 2)No Updates Found! $(tput sgr0)"
	sleep 3
}
	
function supreme_off() {
	dialog --infobox "...Shutting Down..." 3 23 ; sleep 1
	clear
	echo
	echo "[OK System Will Shutdown Now...]"
	clear
	sudo shutdown -P now
}

function supreme_restart() {
	dialog --infobox "...Restarting Now..." 3 20 ; sleep 1
	clear
	echo
	echo "[OK System Will Restart Now...]"
	clear
	sudo reboot
}

function orange_pi_installers() {
    local choice
	
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " SUPREME - INSTALLERS " \
            --ok-label OK --cancel-label Exit \
            --menu "$sb_version" 25 75 20 \
            - "*** AVAILABLE INSTALLERS ***" \
            - "" \
	    1 " -  SORRY NO INSTALLERS AS OF YET" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) installer_sorry  ;;
            -) none ;;
            *)  break ;;
        esac
    done
	clear
}

installer_sorry() {
echo "SORRY NO INSTALLERS AS OF YET"
sleep 5
}

function supreme_setup() {
    local choice
	
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " RETROPIE - SETUP - SWAP " \
            --ok-label OK --cancel-label Exit \
            --menu "$sb_version" 25 75 20 \
            - "*** AVAILABLE INSTALLERS ***" \
            - "" \
	    1 " -  SWAP TO OFFICIAL RETROPIE SETUP" \
	    2 " -  SWAP TO SUPREME RETROPIE SETUP " \
	    3 " -  OPEN OR INSTALL RETROPIE EXTRAS (BY EXARKUNIV)" \
        2>&1 > /dev/tty)

        case "$choice" in
        1) swap_official  ;;
	    2) swap_supreme  ;;
	    3) add_extras  ;;	
        *)  break ;;
        esac
    done
	clear
}

function swap_official() {
    echo -e "$(tput setaf 2)Now Adding The Official RetroPie Setup! $(tput sgr0)"
    sleep 3
    if [ -d /home/pi/RetroPie-Setup ]; then
    sudo rm -R /home/pi/RetroPie-Setup
    fi
    git clone https://github.com/RetroPie/RetroPie-Setup /home/pi/RetroPie-Setup
    echo -e "$(tput setaf 2)Done! $(tput sgr0)"
    sleep 3
}

function swap_supreme() {
    echo -e "$(tput setaf 2)Now Adding The Supreme RetroPie Setup! $(tput sgr0)"
    sleep 3
    if [ -d /home/pi/RetroPie-Setup ]; then
    sudo rm -R /home/pi/RetroPie-Setup
    fi
    git clone https://github.com/SupremePi/RetroPie-Setup-Rearmit /home/pi/RetroPie-Setup
    echo -e "$(tput setaf 2)Done! $(tput sgr0)"
    sleep 3
}

function add_extras() {
    echo -e "$(tput setaf 2)Now Opening RetroPie Extras! $(tput sgr0)"
    sleep 3
    if [ ! -d /home/pi/RetroPie-Extra ]; then
    if (dialog --title "Add RetroPie Extras" --yesno "Would You Like To Add The RetroPie Setup Extras?" 0 0 )
    then
    cd ~
    git clone https://github.com/Exarkuniv/RetroPie-Extra.git
    cd /home/pi/RetroPie-Extra/
    ./install-extras.sh
    fi
    else
    if (dialog --title "Pick Your RetroPie Extras" --yesno "Would You Like To Pick Your RetroPie Setup Extras!" 0 0 )
    then
    cd /home/pi/RetroPie-Extra/
    ./install-extras.sh
    fi
    fi
}
	
function supreme_credits() {
infobox=""
infobox="${infobox}Big thanks to the following:\\n"
infobox="${infobox}Retropie team, Attract team and pegasus team for the foundation of the Supreme builds\n"
infobox="${infobox}\n"
infobox="${infobox}Youtubers:\n"
infobox="${infobox}leepspvideo, Level1online, therexershow, kio diekin, Drew talks & more\n"
infobox="${infobox}\n"
infobox="${infobox}Developers/helpers & Media cretaion:\n"
infobox="${infobox}Rearmit Dev, Rapid Edwin, Daniele Dan, David Marti, Carl Hagstrum, Dwayne Hurst, Eazy Hax, 2Play, RPC80, DerSchlachter, PI Wizard, Bezelproject, HP2 team & Pademonium Cinematics, Retro Devils\n"
infobox="${infobox}\n"
infobox="${infobox}Testers:\n"
infobox="${infobox}Andy,Ben,Britton,kio diekin,Damso,Dan,Korri,chris,Adam.Will,Chase & more\n"
infobox="${infobox}\n"
infobox="${infobox}**Also huge thank you to the RetroPie comunity and all its awsome Devleopers not listed**\n"
infobox="${infobox}\n"
infobox="${infobox}If you do not see your name on the list then your one of the awesome community developers\n"
infobox="${infobox}that made this build possible, so thank you as there is just so manny to list.\n"
infobox="${infobox}\n"
infobox="${infobox}**If you want your name on the list as you been apart of the builds please dont be shy to ask.**\n"


dialog --backtitle "SUPREME CREDITS" \
--title "SUPREME CREDITS" \
--msgbox "${infobox}" 35 110

}

function none() {
	clear
}

main_menu
