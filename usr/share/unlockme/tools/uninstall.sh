#!/bin/bash
# with love from Ralphy
#
# Name: UnlockMe Uninstaller
# https://github.com/ralphys/unlockme/
#
# Created by Ralphy Rhdez <rafaelrhd3z@gmail.com>
# UnlockMe Installer 

if [[ $EUID != "0" ]]; then
	clear
	echo -e "\nThis uninstaller must be run with administrative privileges...\n"
	sudo "$0" "$@" ; exit 0
fi

# variables
# desktop users
_ALLUSERS=$(grep "/bin/bash" < /etc/passwd | grep "[1][0-9][0-9][0-9]" | cut -d: -f1)

clear
echo -e "\n UnlockMe Uninstaller"
echo -e " --------------------\n"

# remove desktop shortcut
function remove_shortcut() {
	echo -e "• Removing desktop shortcut if any...\n"
	for desktopuser in ${_ALLUSERS}; do
      [[ -f "/home/${desktopuser}/Desktop/UnlockMe.desktop" ]] && \
      rm -f /home/${desktopuser}/Desktop/UnlockMe.desktop
      rm -f /home/${desktopuser}/.config/plank/dock{1..3}/launchers/UnlockMe*
    done ; sleep 1
    echo -e "  all done!\n"
}

function scripts_removal() {

	echo -e "\n• Removing UnlockMe..." ; sleep .5

		rm -rf /usr/share/unlockme
		rm -f /usr/share/applications/UnlockMe.desktop
	cd /usr/local/sbin
		rm -f dryapt get_download unlockme-admin unlockme-appearance unlockme-apps 
		rm -f unlockme-main unlock-req-install blockhosts icon-themes-erikdubois
	cd /usr/share/polkit-1/actions
		rm -f com.ubuntu.pkexec.unlockme-apps.policy com.ubuntu.pkexec.unlockme-blockhosts.policy com.ubuntu.pkexec.unlockme-thunar.policy
		rm -f com.ubuntu.pkexec.unlockme-install.policy com.ubuntu.pkexec.unlockme.policy
}

function remove_unlockme() {
	
	echo -e "• Uninstalling Unlockme...\n" ; sleep .5
	echo -e "   Unlockme scripts are about to be removed. Please be advised, you should"
	echo -e "   revert any changes made to your system by the Unlockme scripts before"
	echo -e "   uninstalling it if you are unhappy with the results. This uninstaller"
	echo -e "   will remove the scripts but it will not revert those changes.\n"

	while true; do
    	read -p "  Are you sure you want to remove UnlockMe (y/n)?" yn
    	case $yn in
        	[Yy]* ) scripts_removal ; remove_shortcut
					echo -e "✔ UnlockMe scripts have been removed." 
					echo -e "  -----------------------------------\n" ; break ;;
        	[Nn]* ) echo -e "\n✔ UnlockMe Uninstaller has been aborted."
					echo -e "  --------------------------------------\n" ; break ;;
        		* ) echo -e "\n  Please answer [Y]es or [N]o.\n" ;;
    	esac
	done	
}

remove_unlockme

exit 0


