#!/bin/bash
# SUPREME ULTRA
# The Supreme Team https://github.com/SupremePi/

sb_version="Supreme Online Raspberry Pi"
sb_toolkit=/home/pi/.supreme_toolkit/sb_toolkit
rp_menu=/home/pi/RetroPie/retropiemenu
sb_menu=$sb_toolkit/retropiemenu

#Outside Links
. /home/pi/.supreme_toolkit/sb_toolkit/_scripts/supreme-functions
. /home/pi/.supreme_toolkit/sb_toolkit/_scripts/supreme-vars

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
             
dialog --backtitle "SUPREME ONLINE RASPBERRY PI" \
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
			4 " -  ULTRA ATTRACT-MODE RESTORE" \
			5 " -  SUPREME INSTALLERS" \
	        - "" \
            6 " -  POWER OFF PI" \
            7 " -  RESTART PI" \
	        - "" \
			8 " -  SUPREME CREDITS" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) ultra_restore  ;;
            2) ultra_update  ;;
			3) ultra_fixes  ;;
			4) ultra_attract  ;;
			5) ultra_installers  ;;
	        6) supreme_off  ;;
            7) supreme_restart  ;;
			8) supreme_credits  ;;
            -) none ;;
            *)  break ;;
        esac
    done
	clear
}

function ultra_restore() {
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
	
    #Pi 3 RetroPie Menu Edits 
    if [ "$rpi" = "3" ]; then
    sudo cp $sb_menu_pi3/retropietools/overclock.sh $sb_menu/retropietools/overclock.sh	
	if [ -f $sb_menu/visualtools/supreme-marquee-tool.sh ]; then 
	sudo rm $sb_menu/visualtools/supreme-marquee-tool.sh
	fi
    fi
	
	#Rsync RetroPie Menu files
    if [ -f $rp_menu/raspiconfig.rp ]; then 
	sudo rsync -av $rp_menu/raspiconfig.rp $sb_menu/
    fi
    if [ -f $rp_menu/rpsetup.rp ]; then 
	sudo rsync -av $rp_menu/rpsetup.rp $sb_menu/
    fi
    if [ -f $rp_menu/showip.rp ]; then 
	sudo rsync -av $rp_menu/showip.rp $sb_menu/retropietools/
    fi
    if [ -f $rp_menu/audiosettings.rp ]; then 
	sudo rsync -av $rp_menu/audiosettings.rp $sb_menu/audiotools/
    fi
    if [ -f $rp_menu/bluetooth.rp ]; then 
	sudo rsync -av $rp_menu/bluetooth.rp $sb_menu/retropietools/
    fi
    if [ -f $rp_menu/configedit.rp ]; then 
	sudo rsync -av $rp_menu/configedit.rp $sb_menu/emulationtools/
    fi
    if [ -f $rp_menu/esthemes.rp ]; then 
	sudo rsync -av $rp_menu/esthemes.rp $sb_menu/visualtools/
    fi
    if [ -f $rp_menu/filemanager.rp ]; then 
	sudo rsync -av $rp_menu/filemanager.rp $sb_menu/retropietools/
    fi
    if [ -f $rp_menu/retroarch.rp ]; then 
	sudo rsync -av $rp_menu/retroarch.rp $sb_menu/retropietools/
    fi
    if [ -f $rp_menu/retronetplay.rp ]; then 
	sudo rsync -av $rp_menu/retronetplay.rp $sb_menu/retropietools/
    fi
    if [ -f $rp_menu/runcommand.rp ]; then 
    sudo rsync -av $rp_menu/runcommand.rp $sb_menu/retropietools/
    fi
    if [ -f $rp_menu/splashscreen.rp ]; then 
	sudo rsync -av $rp_menu/splashscreen.rp $sb_menu/visualtools/
    fi
    if [ -f $rp_menu/wifi.rp ]; then 
	sudo rsync -av $rp_menu/wifi.rp $sb_menu/retropietools/
    fi
	
    #Rsync Custom Menu files
    if [ -f $rp_menu/bezelproject.sh ]; then 
    sudo rsync -av $rp_menu/bezelproject.sh $sb_menu/visualtools/
    fi
    if [ -f $rp_menu/hurstythemes.sh ]; then 
    sudo rsync -av $rp_menu/hurstythemes.sh $sb_menu/visualtools/
    fi
    if [ -f $rp_menu/fruitbox.btn ]; then 
    sudo rsync -av $rp_menu/fruitbox.btn $sb_menu/
    fi
    if [ -f /home/pi/tamoplus/files/tamoplus.sh ]; then 
    sudo rsync -av /home/pi/tamoplus/files/tamoplus.sh $sb_menu/
    fi
	
    #Cool Down
    sleep 1
    clear
    echo "Now Fixing Supreme Menu."
    sleep 3
    clear
    rm -rf $rp_menu/* && rsync -av $sb_menu/ $rp_menu && cp $sb_toolkit/retropie-gml/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
    sudo chown -R pi:pi $sb_menu/
	sudo chmod 755 -R $sb_menu/
	echo -e "$(tput setaf 2)Done! $(tput sgr0)"
    sleep 3
    clear
}

function ultra_update() {
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
	if [ ! -f /opt/retropie/supplementary/joystick-selection/joystick_selection.sh ]; then 
    sudo /opt/retropie/supplementary/joystick-selection/joystick_selection.sh
	sudo rm $rp_menu/joystick_selection.sh
    fi
	rm $HOME/.supreme_toolkit/sb_toolkit/retropiemenu/controllertools/joystick_selection.sh
	ln -s /opt/retropie/supplementary/joystick-selection/joystick_selection.sh .supreme_toolkit/sb_toolkit/retropiemenu/controllertools/joystick_selection.sh
    echo -e "$(tput setaf 2)Done! $(tput sgr0)"
}

function ultra_fixes() {
	clear
	echo -e "$(tput setaf 2)Now Downloading All Supreme Ultra Fixes! $(tput sgr0)"
	sleep 3
		
	#Download Fixes
	cd $HOME/
    git clone https://github.com/SupremePi/.supreme_fixes.git
    cd .supreme_fixes/
	
	#Pi 3 changes if needed
	if [ "$rpi" = "3" ]; then
	sudo cp $HOME/.supreme_fixes/pi-3/boot/* $HOME/.supreme_fixes/boot/
    fi
	
    #Sync All New Files		
    rsync -urv --exclude '.git' --exclude 'boot' --exclude 'pi-3' --exclude 'pi-5' --exclude '.gitattributes' --exclude 'opt' --exclude 'home' --exclude 'etc' --exclude 'var' --exclude 'usr' --exclude 'libretrocores' --exclude 'emulators' --exclude 'supplementary' --exclude 'LICENSE' --exclude 'README.md' --exclude 'roms' . /
	sudo rsync -urv boot/ /boot/
    sudo rsync -urv etc/ /etc/
    sudo rsync -urv home/ /home/
	sudo rsync -urv opt/ /opt/
    sudo rsync -urv usr/ /usr/
	echo -e "$(tput setaf 2)Done! $(tput sgr0)"
	sleep 3
	clear
	
	echo -e "$(tput setaf 2)Now Adding Ultra Fixes! Please Wait... $(tput sgr0)"
	#Supreme fixes
    sudo chown pi:pi -R $HOME/RetroPie/videoloadingscreens/
	sudo chmod 755 -R $HOME/RetroPie/videoloadingscreens/	
	
	#Just incase user made changes
	if [ ! -d $HOME/RetroPie/videoloadingscreens/default ]; then
    mkdir $HOME/RetroPie/videoloadingscreens/default
	fi
	
	#Keep tampo plus folders if found but mv extra stuff to default folder.
	if [ -f $HOME/RetroPie/videoloadingscreens/default.mp4 ]; then
	mv $HOME/RetroPie/videoloadingscreens/*.mp4 $HOME/RetroPie/videoloadingscreens/default/
    cd $HOME/RetroPie/videoloadingscreens/	
	sudo find . -maxdepth 1 ! \( -name default -or -name merryxmas -or -name devilchromey -or -name halloweenspecial -or -name supremeteam -or -name carbonite -o -name '.' \) -delete
    if [ ! -d $HOME/RetroPie/videoloadingscreens/supremeteam ]; then
	mkdir $HOME/RetroPie/videoloadingscreens/supremeteam
	fi
	if [ ! -f $HOME/RetroPie/videoloadingscreens/supremeteam/default.mp4 ]; then
	mv $HOME/RetroPie/videoloadingscreens/default/* $HOME/RetroPie/videoloadingscreens/supremeteam/
	fi
	fi
	
    #Simple Attract Mode Edit for pi 3
    if [ "$rpi" = "3" ]; then
	sudo perl -p -i -e 's/supreme-marquee-tool;Supreme Marquee Tool;Visual tools;;;;;;;;;;;;;;/#supreme-marquee-tool;Supreme Marquee Tool;Visual tools;;;;;;;;;;;;;;/g' /opt/retropie/configs/all/attractmode/romlists/Visual\ tools.txt
    fi		
	
	#Quick User or Permission fix
    sudo chmod +x /etc/profile.d/10-retropie* &> /dev/null
    sudo chmod +x /etc/samba/smb.conf* &> /dev/null
	sudo chown pi:pi -R /opt/retropie/configs/
	sudo chown pi:pi -R /home/pi/
	sudo chmod +x /usr/bin/supreme*
    sleep 2
    rm -rf ~/.supreme_fixes/
	echo -e "$(tput setaf 2)Done! $(tput sgr0)"
    sleep 3
	clear
}

function ultra_attract() {
	clear
	echo -e "$(tput setaf 2)Now Restoring Supreme Atrract-Mode! $(tput sgr0)"
	#Sync All New Files	
	cd $HOME/
    git clone https://github.com/SupremePi/.supreme_attract.git
    cd .supreme_attract/
    sudo rsync -urv ambootcheck/ /opt/retropie/configs/all/attractmode/ambootcheck/
	sudo rsync -urv emulators/ /opt/retropie/configs/all/attractmode/emulators/
	sudo rsync -urv intro/ /opt/retropie/configs/all/attractmode/intro/
	sudo rsync -urv layouts/ /opt/retropie/configs/all/attractmode/layouts/
	sudo rsync -urv mame-config/ /opt/retropie/configs/all/attractmode/mame-config/
	sudo rsync -urv menu-art/ /opt/retropie/configs/all/attractmode/menu-art/
	sudo rsync -urv modules/ /opt/retropie/configs/all/attractmode/modules/
	sudo rsync -urv plugins/ /opt/retropie/configs/all/attractmode/plugins/
	sudo rsync -urv romlists/ /opt/retropie/configs/all/attractmode/romlists/
	sudo rsync -urv scraper/ /opt/retropie/configs/all/attractmode/scraper/
	sudo rsync -urv screensaver/ /opt/retropie/configs/all/attractmode/screensaver/
	sudo rsync -urv scripts/ /opt/retropie/configs/all/attractmode/scripts/
	sudo rsync -urv sounds/ /opt/retropie/configs/all/attractmode/sounds/
	sudo rsync -urv stats/ /opt/retropie/configs/all/attractmode/stats/
	
	if [ -f /opt/retropie/configs/all/attractmode/attract.am ]; then 
	sudo mv /opt/retropie/configs/all/attractmode/attract.am /opt/retropie/configs/all/attractmode/attract.am.bk
    fi
    if [ -f /opt/retropie/configs/all/attractmode/attract.cfg ]; then 
	sudo mv /opt/retropie/configs/all/attractmode/attract.cfg /opt/retropie/configs/all/attractmode/attract.cfg.bk
    fi

	sudo rsync -urv attract.am /opt/retropie/configs/all/attractmode/
	sudo rsync -urv attract.cfg /opt/retropie/configs/all/attractmode/
    sudo chmod +x -R /opt/retropie/configs/all/attractmode/*
    sudo chown pi:pi -R /opt/retropie/configs/all/attractmode/*
	sleep 1
    rm -rf ~/.supreme_attract/
	echo -e "$(tput setaf 2)Done! $(tput sgr0)"
    sleep 2
}

function ultra_installers() {
    local choice
	
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " SUPREME - INSTALLERS " \
            --ok-label OK --cancel-label Exit \
            --menu "$sb_version" 25 75 20 \
            - "*** AVAILABLE INSTALLERS ***" \
            - "" \
	    1 " -  INSTALL TAMO PLUS (By ALLRiPPED & Supreme RetroPie)" \
	    2 " -  INSTALL DEVILS-BOX (By The Retro-Devils)" \
	    3 " -  INSTALL Supreme Sinden V2 (Clean Install)" \
	    4 " -  INSTALL Bios Pack (By Retro Devils)" \
	    5 " -  INSTALL D00M Utilities (By RapidEdwin)" \
	    6 " -  INSTALL lr-atari800 Tweaks (By RapidEdwin)" \
	    7 " -  INSTALL XBOX CLOUD GAMING (By Supreme Team)" \
	    8 " -  INSTALL LUNA CLOUD GAMING (By Supreme Team)" \
        2>&1 > /dev/tty)

        case "$choice" in
        1) installer_tamoplus  ;;
        2) installer_devilsbox  ;;
	    3) installer_sinden  ;;
	    4) installer_bios  ;;
	    5) installer_doomutils  ;;
	    6) installer_atari800  ;;
        7) installer_xbox_cloud_gaming  ;;
        8) installer_luna_cloud_gaming  ;;		
        *)  break ;;
        esac
    done
	clear
}
	
installer_tamoplus() {
curl -sSL https://bit.ly/Install-TAMO | bash
}

installer_devilsbox() {
    if (dialog --title "AGREE?" --yesno "Please note us at supreme have no part in this downloader and that you use it at your own risk!!! We do not condone the download of media we dont own!" 0 0 )
    then
    curl -sSL bit.ly/Install-Devils-Box | bash
	else
	clear
    fi
}

installer_sinden() {
if [ -d /home/pi/Lightgun ]; then
    if (dialog --title "REMOVE!" --yesno "You need to remove the old version of sinden you ok with this?" 0 0 )
    then
    sudo rm -R /home/pi/Lightgun
    fi
    fi
	curl -sSL https://raw.githubusercontent.com/SupremePi/supreme-sinden-v2/main/install-lightgun-quick.sh | bash
	clear
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

installer_xbox_cloud_gaming() {
if [ -f /opt/retropie/ports/chromium/chromium.sh ]; then
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
    
	echo -e "$(tput setaf 2)Finished. Please Restart ES To See The changes. INFO: To exit Xbox Cloud Gaming Press ALT & f4 $(tput sgr0)"
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
if [ -f /opt/retropie/ports/chromium/chromium.sh ]; then
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
    
	echo -e "$(tput setaf 2)Finished. Please Restart ES To See The changes. INFO: To exit luna Cloud Gaming Press ALT & f4 $(tput sgr0)"
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

main_menu
