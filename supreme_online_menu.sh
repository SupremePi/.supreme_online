#!/bin/bash
# The Supreme Team https://github.com/SupremePi/

#Open The Correct Online Menu
if grep -q 'Raspberry' /proc/device-tree/model; then
curl -sSL https://raw.githubusercontent.com/SupremePi/.supreme_online/main/supreme_online_menu_raspberry_pi.sh | bash
elif grep -q 'Orange' /proc/device-tree/model; then
curl -sSL https://raw.githubusercontent.com/SupremePi/.supreme_online/main/supreme_online_menu_orange_pi.sh | bash
elif grep -q 'XU4' /proc/device-tree/model; then
curl -sSL https://raw.githubusercontent.com/SupremePi/.supreme_online/main/supreme_online_menu_odroid.sh | bash
else
echo -e "$(tput setaf 2)Your Device Is Not Supported? $(tput sgr0)"
sleep 3
fi

clear
