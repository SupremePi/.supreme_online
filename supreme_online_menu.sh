#!/bin/bash
# The Supreme Team https://github.com/SupremePi/

# Open The Correct Online Toolkit Menu
if grep -q 'Raspberry Pi 5' /proc/device-tree/model 2>/dev/null; then
    curl -sSL https://raw.githubusercontent.com/SupremePi/.supreme_online/main/supreme_online_menu_raspberry_pi_5.sh 2>/dev/null | bash
elif grep -q 'Raspberry' /proc/device-tree/model 2>/dev/null; then
    curl -sSL https://raw.githubusercontent.com/SupremePi/.supreme_online/main/supreme_online_menu_raspberry_pi.sh 2>/dev/null | bash
elif grep -q 'Orange' /proc/device-tree/model 2>/dev/null; then
    curl -sSL https://raw.githubusercontent.com/SupremePi/.supreme_online/main/supreme_online_menu_orange_pi.sh 2>/dev/null | bash
elif grep -q 'XU4' /proc/device-tree/model 2>/dev/null; then
    curl -sSL https://raw.githubusercontent.com/SupremePi/.supreme_online/main/supreme_online_menu_odroid.sh 2>/dev/null | bash
elif uname -srmo 2>/dev/null | grep -q 'x86_64' 2>/dev/null; then
    curl -sSL https://raw.githubusercontent.com/SupremePi/.supreme_online/main/supreme_online_menu_x86_64.sh 2>/dev/null | bash
else
    echo -e "$(tput setaf 2)Your Device Is Not Supported? $(tput sgr0)"
    sleep 3
fi

clear
