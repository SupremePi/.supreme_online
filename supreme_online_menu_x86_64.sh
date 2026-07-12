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
        choice=$(dialog --backtitle "$BACKTITLE" --title " SUPREME - ONLINE V3" \
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
	    2) x86_64_installers  ;;
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

function x86_64_installers() {
    local choice
	
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " SUPREME - INSTALLERS " \
            --ok-label OK --cancel-label Exit \
            --menu "$sb_version" 25 75 20 \
            - "*** AVAILABLE INSTALLERS ***" \
            - "" \
	    1 " - STREAMBERT INSTALLER" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) streambert_installer  ;;
            -) none ;;
            *)  break ;;
        esac
    done
	clear
}

streambert_installer() {
# ============================================
# Streambert RetroPie Installer
# ============================================

set -e

# ============================================
# Variables
# ============================================

STREAMBERT_URL="https://github.com/KUAILESHANGWEI/streambert/releases/download/2.6.0/Streambert-2.6.0.AppImage"

# Cloud paths
CLOUD_DIR="$HOME/RetroPie/roms/cloud"
BOXART_DIR="$CLOUD_DIR/boxart"
LAUNCHER_PATH="$CLOUD_DIR/Streambert.sh"

# Ports paths
PORTS_ROM_DIR="$HOME/RetroPie/roms/ports"
PORTS_BOXART_DIR="$PORTS_ROM_DIR/boxart"
PORTS_LAUNCHER_PATH="$PORTS_ROM_DIR/Streambert.sh"

# RetroPie integration
SUPP_DIR="/opt/retropie/supplementary/streambert"
EMU_DIR="/opt/retropie/emulators/streambert"
PORTS_CONFIG_DIR="/opt/retropie/configs/ports/streambert"

# AppImage install path
APPIMAGE_SAVE_PATH="$EMU_DIR/Streambert.AppImage"

# Icon path
ICON_PATH="$BOXART_DIR/streambert.png"

# ============================================
# Architecture check
# ============================================

ARCH=$(uname -m)

case "$ARCH" in
    x86_64|aarch64)
        echo "Detected supported architecture: $ARCH"
        ;;
    *)
        echo "ERROR: Unsupported architecture: $ARCH"
        echo "64-bit x86 or ARM required."
        exit 1
        ;;
esac

# ============================================
# Install dependencies
# ============================================

echo "=== Installing dependencies ==="

sudo apt update -qq

sudo apt install -y \
    curl \
    wget \
    matchbox-window-manager \
    x11-xserver-utils \
    libnss3 \
    libxss1 \
    libasound2 \
    libgtk-3-0 \
    libxtst6 \
    fuse

# ============================================
# Create folders
# ============================================

echo "=== Creating directories ==="

mkdir -p "$CLOUD_DIR"
mkdir -p "$BOXART_DIR"

mkdir -p "$PORTS_ROM_DIR"
mkdir -p "$PORTS_BOXART_DIR"

sudo mkdir -p "$SUPP_DIR"
sudo mkdir -p "$EMU_DIR"
sudo mkdir -p "$PORTS_CONFIG_DIR"

# ============================================
# Download Streambert
# ============================================

echo "=== Downloading Streambert AppImage ==="

wget -O /tmp/Streambert.AppImage "$STREAMBERT_URL"

sudo mv /tmp/Streambert.AppImage "$APPIMAGE_SAVE_PATH"

sudo chmod +x "$APPIMAGE_SAVE_PATH"

# ============================================
# Download artwork
# ============================================

echo "=== Downloading artwork ==="

ICON_URL="https://raw.githubusercontent.com/KUAILESHANGWEI/streambert/main/public/icon.png"

wget -O "$ICON_PATH" "$ICON_URL" || true

cp "$ICON_PATH" "$PORTS_BOXART_DIR/streambert.png" || true

# ============================================
# Create launcher script
# ============================================

echo "=== Creating launcher ==="

sudo tee "$SUPP_DIR/streambert.sh" > /dev/null <<EOF
#!/bin/bash

xset -dpms s off s noblank

matchbox-window-manager -use_titlebar no &

"$APPIMAGE_SAVE_PATH" --no-sandbox --start-fullscreen
EOF

sudo chmod +x "$SUPP_DIR/streambert.sh"

# ============================================
# Create RetroPie launchers
# ============================================

echo "=== Creating RetroPie launchers ==="

# Cloud launcher
cat > "$LAUNCHER_PATH" <<EOF
#!/bin/bash
"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "streambert" ""
EOF

chmod +x "$LAUNCHER_PATH"

# Ports launcher
cat > "$PORTS_LAUNCHER_PATH" <<EOF
#!/bin/bash
"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "streambert" ""
EOF

chmod +x "$PORTS_LAUNCHER_PATH"

# ============================================
# Configure RetroPie port
# ============================================

echo "=== Configuring RetroPie port ==="

sudo tee "$PORTS_CONFIG_DIR/emulators.cfg" > /dev/null <<EOF
streambert = "XINIT: /opt/retropie/supplementary/streambert/streambert.sh"
default = "streambert"
EOF

sudo chmod 644 "$PORTS_CONFIG_DIR/emulators.cfg"

# ============================================
# Update gamelist.xml files
# ============================================

update_gamelist() {

    local GAMELIST_XML="$1"
    local ENTRY_PATH="$2"

    if [[ -f "$GAMELIST_XML" ]]; then

        if grep -q "<name>Streambert</name>" "$GAMELIST_XML"; then
            echo "Streambert already exists in $GAMELIST_XML"
        else

            sed -i '/<\/gameList>/ i \
  <game>\n\
    <path>'"$ENTRY_PATH"'</path>\n\
    <name>Streambert</name>\n\
    <desc>Streambert Streaming App</desc>\n\
    <image>./boxart/streambert.png</image>\n\
  </game>' "$GAMELIST_XML"

            echo "Added Streambert to $GAMELIST_XML"
        fi

    else

        echo "Creating new gamelist.xml at $GAMELIST_XML"

cat > "$GAMELIST_XML" <<EOF
<?xml version="1.0"?>
<gameList>
  <game>
    <path>$ENTRY_PATH</path>
    <name>Streambert</name>
    <desc>Streambert Streaming App</desc>
    <image>./boxart/streambert.png</image>
  </game>
</gameList>
EOF

    fi
}

echo "=== Updating Cloud gamelist ==="

update_gamelist \
"$CLOUD_DIR/gamelist.xml" \
"./Streambert.sh"

echo "=== Updating Ports gamelist ==="

update_gamelist \
"$PORTS_ROM_DIR/gamelist.xml" \
"./Streambert.sh"

# ============================================
# Create desktop launcher
# ============================================

echo "=== Creating desktop launcher ==="

mkdir -p "$HOME/.local/share/applications"

cat <<EOF > "$HOME/.local/share/applications/streambert.desktop"
[Desktop Entry]
Name=Streambert
Comment=Launch Streambert
Exec=$APPIMAGE_SAVE_PATH --no-sandbox
Icon=$ICON_PATH
Terminal=false
Type=Application
Categories=Video;
EOF

chmod +x "$HOME/.local/share/applications/streambert.desktop"

mkdir -p "$HOME/Desktop"

cp "$HOME/.local/share/applications/streambert.desktop" \
"$HOME/Desktop/"

chmod +x "$HOME/Desktop/streambert.desktop"

# ============================================
# Finished
# ============================================

echo
echo "============================================"
echo "Streambert installation complete!"
echo "============================================"
echo
echo "Added to:"
echo "- RetroPie Cloud"
echo "- RetroPie Ports"
echo "- Desktop shortcut"

# ============================================
# IMPORTANT MESSAGE (DIALOG)
# ============================================

dialog --title "IMPORTANT" --msgbox "\
Please take a picture of this link and open it on another device:

https://github.com/truelockmc/streambert/blob/main/tmdb-tutorial.md

Follow the steps to get your FREE TMDB API key.

The API key is needed to load media correctly!

REAL INFO IS NOT REQUIRED." 12 80
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
	git clone https://github.com/supremeretrogaming/RetroPie-Setup /home/pi/RetroPie-Setup
    #git clone https://github.com/SupremePi/RetroPie-Setup-Rearmit /home/pi/RetroPie-Setup
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
