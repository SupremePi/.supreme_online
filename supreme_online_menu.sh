#!/bin/bash
# SUPREME ULTRA
# The Supreme Team https://github.com/SupremePi/

sb_version="Supreme Online Version 1"

################
#SUPREME ONLINE#
################

infobox=""
infobox="${infobox}\n"
infobox="${infobox}This Menu Will Let You Fully Restore Or Update Ultra!.\n"
infobox="${infobox}\n"
infobox="${infobox}This Can Happen By Basic User Updates Or Manual Changes.\n"
infobox="${infobox}\n"
infobox="${infobox}We Will Use Descriptive Options For Easy Reference!\n"
infobox="${infobox}\n"
infobox="${infobox}SUPREME ULTRA\n" 
             
dialog --backtitle "SUPREME ONLINE" \
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
	        1 " -  FULL SUPREME ULTRA RESTORE" \
            2 " -  CHECK FOR UPDATES/FIXES" \
			- "" \
            3 " -  POWER OFF PI" \
            4 " -  RESTART PI" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) ultra_restore  ;;
            2) ultra_update  ;;
	        3) supreme_off  ;;
            4) supreme_restart  ;;
            -) none ;;
            *)  break ;;
        esac
    done
	clear
}

function ultra_restore() {
    echo "FULL RESTORE COMING SOON"
	sleep 4
	clear
}

function ultra_update() {
    echo "CHECK FOR UPDATES COMING SOON"
	sleep 4
	clear
}

function supreme_off() {
	dialog --infobox "...Shutting Down..." 3 23 ; sleep 1
	clear
	echo
	echo "[OK System Will Shutdown now...]"
	clear
	sudo shutdown -P now
}

function supreme_restart() {
	dialog --infobox "...Starting..." 3 20 ; sleep 1
	clear
	echo
	echo "[OK System Will Restart now...]"
	clear
	sudo reboot
}

function none() {
	clear
}

main_menu
