#!/bin/bash
# SUPREME ULTRA
# The Supreme Team https://github.com/SupremePi/

sb_version="Supreme Online Orange Pi"

################
#SUPREME ONLINE#
################

infobox=""
infobox="${infobox}\n"
infobox="${infobox}SUPREME NEWS! TEAM SPLIT.\n"
infobox="${infobox}\n"
infobox="${infobox}PLEASE UNFOLLOW THE SUPREME RETRO GAMING YOUTUBE AND PATREON THIS IS NOT US.\n"
infobox="${infobox}\n"
infobox="${infobox}This Menu Will Let You Fully Restore Or Update Ultra!.\n"
infobox="${infobox}\n"
infobox="${infobox}This Can Happen By Basic User Updates Or Manual Changes.\n"
infobox="${infobox}\n"
infobox="${infobox}We Will Use Descriptive Options For Easy Reference!\n"
infobox="${infobox}\n"
infobox="${infobox}SUPREME ULTRA\n" 
             
dialog --backtitle "SUPREME ONLINE ORANGE PI" \
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
	    2 " -  ORANGE PI INSTALLERS" \
                - "" \
            3 " -  POWER OFF PI" \
            4 " -  RESTART PI" \
	        - "" \
	    5 " -  SUPREME CREDITS" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) supreme_updates  ;;
	    2) orange_pi_installers  ;;
	    3) supreme_off  ;;			
            4) supreme_restart  ;;
	    5) supreme_credits  ;;
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
	    1 " -  INSTALL XBOX CLOUD GAMING (By Supreme Team)" \
	    2 " -  INSTALL LUNA CLOUD GAMING (By Supreme Team)" \
            3 " -  INSTALL NVIDIA CLOUD GAMING (By Supreme Team)" \
            4 " -  INSTALL ANTSTREAM CLOUD GAMING (By Supreme Team)" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) installer_xbox_cloud_gaming  ;;
	    2) installer_luna_cloud_gaming  ;;
	    3) installer_nvidia_cloud_gaming  ;;			
            4) installer_antstream_cloud_gaming  ;;
            -) none ;;
            *)  break ;;
        esac
    done
	clear
}

installer_xbox_cloud_gaming() {
if [ -f /opt/retropie/supplementary/chromium/chromium.sh ]; then
	echo -e "$(tput setaf 2)Now Adding Xbox Cloud Gaming To Ports Menu $(tput sgr0)"
	echo
	sleep 3	
#Adds xbox cloud gaming shortcut to ports
cat <<\EOF01 > "/home/pi/RetroPie/roms/ports/Xbox Cloud Gaming.sh"
#!/bin/bash
"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "xbox-cloud-gaming" ""
EOF01
sudo chmod +x /home/pi/RetroPie/roms/ports/Xbox\ Cloud\ Gaming.sh

mkdir /opt/retropie/configs/ports/xbox-cloud-gaming 2> /dev/null
cat <<\EOF02 > "/opt/retropie/configs/ports/xbox-cloud-gaming/emulators.cfg"
xbox-cloud-gaming = "XINIT: /opt/retropie/supplementary/xbox-cloud-gaming/xbox-cloud-gaming.sh"
default = "xbox-cloud-gaming"
EOF02
sudo chmod +x /opt/retropie/configs/ports/xbox-cloud-gaming/emulators.cfg

sudo mkdir /opt/retropie/supplementary/xbox-cloud-gaming 2> /dev/null
sudo bash -c 'cat > /opt/retropie/supplementary/xbox-cloud-gaming/xbox-cloud-gaming.sh' << EOF
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
unclutter &
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
chromium-browser --disable-infobars --enable-features=OverlayScrollbar --kiosk 'https://xbox.com/play'
EOF
sudo chmod +x /opt/retropie/supplementary/xbox-cloud-gaming/xbox-cloud-gaming.sh
    
	echo -e "$(tput setaf 2)Finished. Please Restart ES To See The changes. INFO: To Exit Xbox Cloud Gaming Press ALT & f4 $(tput sgr0)"
	echo
	sleep 5
clear
else
	echo -e "$(tput setaf 2)Sorry but your missing the Chromium Browser$(tput sgr0)"
	echo
	sleep 5
clear
fi
}

installer_luna_cloud_gaming() {
if [ -f /opt/retropie/supplementary/chromium/chromium.sh ]; then
	echo -e "$(tput setaf 2)Now Adding Luna Cloud Gaming To Ports Menu $(tput sgr0)"
	echo
	sleep 3	
#Adds luna cloud gaming shortcut to ports
cat <<\EOF01 > "/home/pi/RetroPie/roms/ports/Luna Cloud Gaming.sh"
#!/bin/bash
"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "luna-cloud-gaming" ""
EOF01
sudo chmod +x /home/pi/RetroPie/roms/ports/Luna\ Cloud\ Gaming.sh

mkdir /opt/retropie/configs/ports/luna-cloud-gaming 2> /dev/null
cat <<\EOF02 > "/opt/retropie/configs/ports/luna-cloud-gaming/emulators.cfg"
luna-cloud-gaming = "XINIT: /opt/retropie/supplementary/luna-cloud-gaming/luna-cloud-gaming.sh"
default = "luna-cloud-gaming"
EOF02
sudo chmod +x /opt/retropie/configs/ports/luna-cloud-gaming/emulators.cfg

sudo mkdir /opt/retropie/supplementary/luna-cloud-gaming 2> /dev/null
sudo bash -c 'cat > /opt/retropie/supplementary/luna-cloud-gaming/luna-cloud-gaming.sh' << EOF
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
unclutter &
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
chromium-browser --disable-infobars --enable-features=OverlayScrollbar --kiosk 'https://luna.amazon.com/'
EOF
sudo chmod +x /opt/retropie/supplementary/luna-cloud-gaming/luna-cloud-gaming.sh
    
	echo -e "$(tput setaf 2)Finished. Please Restart ES To See The changes. INFO: To Exit Luna Cloud Gaming Press ALT & f4 $(tput sgr0)"
	echo
	sleep 5
clear
else
	echo -e "$(tput setaf 2)Sorry but your missing the Chromium Browser$(tput sgr0)"
	echo
	sleep 5
clear
fi
}

installer_nvidia_cloud_gaming() {
if [ -f /opt/retropie/supplementary/nvidia/nvidia.sh ]; then
	echo -e "$(tput setaf 2)Now Adding Nvidia Cloud Gaming To Ports Menu $(tput sgr0)"
	echo
	sleep 3	
#Adds nvidia cloud gaming shortcut to ports
cat <<\EOF01 > "/home/pi/RetroPie/roms/ports/Nvidia Cloud Gaming.sh"
#!/bin/bash
"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "nvidia-cloud-gaming" ""
EOF01
sudo chmod +x /home/pi/RetroPie/roms/ports/Nvidia\ Cloud\ Gaming.sh

mkdir /opt/retropie/configs/ports/nvidia-cloud-gaming 2> /dev/null
cat <<\EOF02 > "/opt/retropie/configs/ports/nvidia-cloud-gaming/emulators.cfg"
nvidia-cloud-gaming = "XINIT: /opt/retropie/supplementary/nvidia-cloud-gaming/nvidia-cloud-gaming.sh"
default = "nvidia-cloud-gaming"
EOF02
sudo chmod +x /opt/retropie/configs/ports/nvidia-cloud-gaming/emulators.cfg

sudo mkdir /opt/retropie/supplementary/nvidia-cloud-gaming 2> /dev/null
sudo bash -c 'cat > /opt/retropie/supplementary/nvidia-cloud-gaming/nvidia-cloud-gaming.sh' << EOF
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
unclutter &
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
chromium-browser --disable-infobars --enable-features=OverlayScrollbar --kiosk 'https://play.geforcenow.com/'
EOF
sudo chmod +x /opt/retropie/supplementary/nvidia-cloud-gaming/nvidia-cloud-gaming.sh

	echo -e "$(tput setaf 2)Finished. Please Restart ES To See The changes. INFO: To Exit Nvidia Cloud Gaming Press ALT & f4 $(tput sgr0)"
	echo
	sleep 5
clear
else
	echo -e "$(tput setaf 2)Sorry but your missing the Chromium Browser$(tput sgr0)"
	echo
	sleep 5
clear
fi
}

installer_antstream_cloud_gaming() {
if [ -f /opt/retropie/supplementary/chromium/chromium.sh ]; then
	echo -e "$(tput setaf 2)Now Adding Antstream Cloud Gaming To Ports Menu $(tput sgr0)"
	echo
	sleep 3	
#Adds antstream cloud gaming shortcut to ports
cat <<\EOF01 > "/home/pi/RetroPie/roms/ports/Antstream Cloud Gaming.sh"
#!/bin/bash
"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "antstream-cloud-gaming" ""
EOF01
sudo chmod +x /home/pi/RetroPie/roms/ports/Antstream\ Cloud\ Gaming.sh

mkdir /opt/retropie/configs/ports/antstream-cloud-gaming 2> /dev/null
cat <<\EOF02 > "/opt/retropie/configs/ports/antstream-cloud-gaming/emulators.cfg"
nvidia-cloud-gaming = "XINIT: /opt/retropie/supplementary/antstream-cloud-gaming/antstream-cloud-gaming.sh"
default = "antstream-cloud-gaming"
EOF02
sudo chmod +x /opt/retropie/configs/ports/antstream-cloud-gaming/emulators.cfg

sudo mkdir /opt/retropie/supplementary/antstream-cloud-gaming 2> /dev/null
sudo bash -c 'cat > /opt/retropie/supplementary/antstream-cloud-gaming/antstream-cloud-gaming.sh' << EOF
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
unclutter &
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
chromium-browser --disable-infobars --enable-features=OverlayScrollbar --kiosk 'https://live.antstream.com/'
EOF
sudo chmod +x /opt/retropie/supplementary/antstream-cloud-gaming/antstream-cloud-gaming.sh
        echo -e "$(tput setaf 2)Finished. Please Restart ES To See The changes. INFO: To Exit Antstream Cloud Gaming Press ALT & f4 $(tput sgr0)"
	echo
	sleep 5
clear
else
	echo -e "$(tput setaf 2)Sorry but your missing the Chromium Browser$(tput sgr0)"
	echo
	sleep 5
clear
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
