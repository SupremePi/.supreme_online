#!/bin/bash
# SUPREME ULTRA
# The Supreme Team https://github.com/SupremePi/

sb_version="Supreme Online Raspberry Pi"
sb_toolkit=/home/pi/.supreme_toolkit/sb_toolkit
rp_menu=/home/pi/RetroPie/retropiemenu
sb_menu=$sb_toolkit/retropiemenu
sb_menu_pi5=$sb_toolkit/retropiemenu-pi5

function quick_check() {
if [ ! -d /home/pi/.supreme_toolkit ]; then
    echo -e "$(tput setaf 2)Looks like the toolkit was not found on your build but no worries adding it now!$(tput sgr0)"
    sleep 3
    cd /home/pi/
    git clone https://github.com/SupremePi/.supreme_toolkit.git
    clear
    cd $HOME/.supreme_toolkit
    chmod +x -R ./
    echo -e "$(tput setaf 2)Finished!$(tput sgr0)"
    sleep 3
    clear 
    /home/pi/RetroPie/retropiemenu/supreme-online-toolkit.sh
else
main_menu
fi
}

#Outside Links
if [ -d /home/pi/.supreme_toolkit ]; then
. /home/pi/.supreme_toolkit/sb_toolkit/_scripts/supreme-functions
. /home/pi/.supreme_toolkit/sb_toolkit/_scripts/supreme-vars
fi

################
#SUPREME ONLINE#
################

infobox=""
infobox="${infobox}\n"
infobox="${infobox}SUPREME NEWS! TEAM SPLIT.\n"
infobox="${infobox}\n"
infobox="${infobox}PLEASE UNFOLLOW THE SUPREME RETRO GAMING YOUTUBE AND PATREON THIS IS NOT US.\n"
infobox="${infobox}\n"
infobox="${infobox}This Menu is in BETA on the PI 5.\n"
infobox="${infobox}\n"
infobox="${infobox}This online tool is used to update and repair you raspberry PI 5 build!.\n"
infobox="${infobox}\n"
infobox="${infobox}We Will Use Descriptive Options For Easy Reference!\n"
infobox="${infobox}\n"
infobox="${infobox}SUPREME TEAM\n" 
             
dialog --backtitle "SUPREME ONLINE RASPBERRY PI 5" \
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
	        1 " -  ULTRA TOOL-KIT RESTORE (CLEAN INSTALL)" \
			2 " -  ULTRA TOOL-KIT UPDATE CHECKER" \
            3 " -  CHECK FOR ULTRA FIXES" \
			4 " -  CHECK FOR OS UPDATES" \
			5 " -  SUPREME INSTALLERS" \
	        - "" \
            6 " -  POWER OFF PI" \
            7 " -  RESTART PI" \
	        - "" \
			8 " -  SUPREME CREDITS" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) supreme_restore  ;;
            2) supreme_update  ;;
			3) supreme_fixes  ;;
			4) supreme_update_os  ;;
			5) supreme_installers  ;;
	        6) supreme_off  ;;
            7) supreme_restart  ;;
			8) supreme_credits  ;;
            -) none ;;
            *)  break ;;
        esac
    done
	clear
}


function supreme_restore() {
    #Reinstall Supreme Toolkit
    echo -e "$(tput setaf 2)Now Restoring Supreme Toolkit And Updating Retropie Menus! $(tput sgr0)"
	sleep 3
    if [ -d /home/pi/.supreme_toolkit ]; then
    sudo mv /home/pi/.supreme_toolkit /home/pi/.supreme_toolkit.bk
    sleep 3
	cd /home/pi/
    git clone https://github.com/SupremePi/.supreme_toolkit.git
	clear
	cd $HOME/.supreme_toolkit
	chmod +x -R ./
    fi
	if [ -d /home/pi/.supreme_toolkit ]; then
    if (dialog --title "REMOVE!" --yesno "Would You Like To Remove The Supreme Toolkit Back Up To Save Space!" 0 0 )
    then
    sudo rm -R /home/pi/.supreme_toolkit.bk
    fi
    fi
    echo -e "$(tput setaf 2)Now Restoring Supreme Retropie Menus From Tool-Kit! $(tput sgr0)"
    sleep 3
	
	#Rsync RetroPie Menu files
    if [ -f $rp_menu/raspiconfig.rp ]; then 
	sudo rsync -av $rp_menu/raspiconfig.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/rpsetup.rp ]; then 
	sudo rsync -av $rp_menu/rpsetup.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/showip.rp ]; then 
	sudo rsync -av $rp_menu/showip.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/audiosettings.rp ]; then 
	sudo rsync -av $rp_menu/audiosettings.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/bluetooth.rp ]; then 
	sudo rsync -av $rp_menu/bluetooth.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/configedit.rp ]; then 
	sudo rsync -av $rp_menu/configedit.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/esthemes.rp ]; then 
	sudo rsync -av $rp_menu/esthemes.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/filemanager.rp ]; then 
	sudo rsync -av $rp_menu/filemanager.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/retroarch.rp ]; then 
	sudo rsync -av $rp_menu/retroarch.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/retronetplay.rp ]; then 
	sudo rsync -av $rp_menu/retronetplay.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/runcommand.rp ]; then 
    sudo rsync -av $rp_menu/runcommand.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/splashscreen.rp ]; then 
	sudo rsync -av $rp_menu/splashscreen.rp $sb_menu_pi5/
    fi
    if [ -f $rp_menu/wifi.rp ]; then 
	sudo rsync -av $rp_menu/wifi.rp $sb_menu_pi5/
    fi
	
    #Rsync Custom Menu files
    if [ -f $rp_menu/bezelproject.sh ]; then 
    sudo rsync -av $rp_menu/bezelproject.sh $sb_menu_pi5/
    fi
    if [ -f $rp_menu/hurstythemes.sh ]; then 
    sudo rsync -av $rp_menu/hurstythemes.sh $sb_menu_pi5/
    fi
    if [ -d $rp_menu/imp ]; then 
    sudo rsync -av $rp_menu/imp $sb_menu_pi5/imp
    fi
	
    #Cool Down
    sleep 1
    clear
    echo "Now Fixing Supreme Menu."
    sleep 3
    clear
    rm -rf $rp_menu/* && rsync -av $sb_menu_pi5/ $rp_menu && cp $sb_toolkit/retropie-gml-pi5/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
    sudo chown -R pi:pi $sb_menu_pi5/
	sudo chmod 755 -R $sb_menu_pi5/
	echo -e "$(tput setaf 2)Done! $(tput sgr0)"
    sleep 3
    clear
}

function supreme_update() {
	#dialog --infobox "...Updating..." 3 20 ; sleep 1
	clear
	cd $HOME/.supreme_toolkit
	echo
	echo -e "$(tput setaf 2)Let's check that your on latest Supreme Tool kit... $(tput sgr0)"
	echo
	sleep 3
	git fetch
	git reset --hard HEAD
	#git reset --hard && git clean -f -d
	git merge '@{u}'
	sleep 2
	echo
	find -name "*.sh" ! -name "joystick_selection.sh" -print0 | xargs -0 chmod 755
	find -name "*.py" -print0 | xargs -0 chmod 755
	find -name "*.rp" ! -name "raspiconfig.rp" ! -name "rpsetup.rp" | xargs sudo chown root:root
    echo -e "$(tput setaf 2)Done! $(tput sgr0)"
}

function supreme_fixes() {
	clear
	echo -e "$(tput setaf 2)Now Downloading All Supreme Ultra Fixes! $(tput sgr0)"
	sleep 3
		
	#Download Fixes
	cd $HOME/
    git clone https://github.com/SupremePi/.supreme_fixes.git
	cd $HOME/.supreme_fixes/pi-5/

    #Sync All New Files		
    rsync -urv --exclude '.git' --exclude 'boot' --exclude 'pi-3' --exclude 'pi-5' --exclude '.gitattributes' --exclude 'opt' --exclude 'home' --exclude 'etc' --exclude 'var' --exclude 'usr' --exclude 'libretrocores' --exclude 'emulators' --exclude 'supplementary' --exclude 'LICENSE' --exclude 'README.md' --exclude 'roms' . /
	sudo rsync -urv boot/ /boot/
	if [ -d $HOME/.supreme_fixes/etc ]; then
	sudo rsync -urv etc/ /etc/
	fi
	if [ -d $HOME/.supreme_fixes/home ]; then
	sudo rsync -urv home/ /home/
	fi
	if [ -d $HOME/.supreme_fixes/opt ]; then
	sudo rsync -urv opt/ /opt/
	fi
    if [ -d $HOME/.supreme_fixes/usr ]; then
	sudo rsync -urv usr/ /usr/
	fi
    sleep 2
	cd $HOME/
    rm -rf ~/.supreme_fixes/
	echo -e "$(tput setaf 2)Done! $(tput sgr0)"
    sleep 3
	clear
}

function supreme_update_os() {
       echo "Checking for updates..." 
       sleep 2 
       sudo apt update -y
       echo "Now upgrading packages..." 
       sleep 2
       sudo apt upgrade -y
}

function supreme_installers() {
    local choice
	
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " SUPREME - INSTALLERS " \
            --ok-label OK --cancel-label Exit \
            --menu "$sb_version" 25 75 20 \
            - "*** AVAILABLE INSTALLERS ***" \
            - "" \
	    1 " -  INSTALL DEVILS-BOX (By The Retro-Devils)" \
	    2 " -  INSTALL Bios Pack (By Retro Devils)" \
	    3 " -  INSTALL D00M Utilities (By RapidEdwin)" \
	    4 " -  INSTALL lr-atari800 Tweaks (By RapidEdwin)" \
        2>&1 > /dev/tty)

        case "$choice" in
        1) installer_devilsbox  ;;
	    2) installer_bios  ;;
	    3) installer_doomutils  ;;
	    4) installer_atari800  ;;	
        *)  break ;;
        esac
    done
	clear
}
	
installer_devilsbox() {
    if (dialog --title "AGREE?" --yesno "Please note us at supreme have no part in this downloader and that you use it at your own risk!!! We do not condone the download of media we dont own!" 0 0 )
    then
    curl -sSL bit.ly/Install-Devils-Box | bash
	else
	clear
    fi
}

installer_bios() {
HOSTB="https://archive.org/download/devils-bios"

clear
wget -m -r -np -nH -nd -R "index.html" "${HOSTB}"/BIOS/ -P "$HOME"/RetroPie/BIOS/ -erobots=off
rm -f "$HOME"/RetroPie/BIOS/index.html.tmp
}

installer_doomutils() {
curl -sSL https://raw.githubusercontent.com/RapidEdwin08/doom-utils/main/doom-utils.sh  | bash
clear
}

installer_atari800() {
curl -sSL https://raw.githubusercontent.com/RapidEdwin08/lr-atari800-tweaks/main/lr-atari800-tweaks.sh  | bash
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

function supreme_credits() {
infobox=""
infobox="${infobox}Big thanks to the following:\\n"
infobox="${infobox}Retropie team, Attract team and pegasus team for the foundation of the pi 4 builds\n"
infobox="${infobox}\n"
infobox="${infobox}Youtubers:\n"
infobox="${infobox}leepspvideo, Level1online, therexershow, kio diekin, Drew talks & more\n"
infobox="${infobox}\n"
infobox="${infobox}Developers/helpers & Media cretaion:\n"
infobox="${infobox}Rapid Edwin, Daniele Dan, David Marti, Carl Hagstrum, Dwayne Hurst, Eazy Hax, 2Play, RPC80, DerSchlachter, PI Wizard, Bezelproject, HP2 team & Pademonium Cinematics, Retro Devils\n"
infobox="${infobox}\n"
infobox="${infobox}Testers:\n"
infobox="${infobox}Andy,Ben,Britton,kio diekin,Damso,Dan,Korri,chris,Adam.Will,Chase & more\n"
infobox="${infobox}\n"
infobox="${infobox}**Also huge thank you to the RetroPie comunity and all its awsome Devleopers not listed**\n"
infobox="${infobox}\n"
infobox="${infobox}If you do not see your name on the list then your one of the awesome community developers\n"
infobox="${infobox}that made this build possible, so thank you as there is just so manny to list.\n"
infobox="${infobox}\n"
infobox="${infobox}**If you want your name on the listed as you been apart of the build please dont be shy to ask.**\n"


dialog --backtitle "SUPREME CREDITS" \
--title "SUPREME CREDITS" \
--msgbox "${infobox}" 35 110

}

function none() {
	clear
}

quick_check
