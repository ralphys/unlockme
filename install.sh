#!/bin/bash
# with love from Ralphy
#
# UnlockMe: Customize, tweak and clean your system
# https://github.com/ralphys/unlockme/
#
# Created by Ralphy Rhdez <rafaelrhd3z@gmail.com>
# UnlockMe Installer 

if [[ "$EUID" != "0" ]]; then
	clear
	echo -e "\nThis installer must be run with administrative privileges...\n"
	sudo "$0" "$@" ; exit 0
fi

# variables
_DTGIT="/tmp/unlockme" _ADMUSER=$(sudo -u ${SUDO_USER:-$USER} whoami)
_SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# if temp dir exists; remove it
[[ -d "$_DTGIT" ]] && rm -rf "$_DTGIT"

clear
echo -e "\n UnlockMe Installer"
echo -e " -------------------\n"

# functions
function quiet_git() {
    stdout=$(tempfile)
    stderr=$(tempfile)
    if ! git "$@" </dev/null >$stdout 2>$stderr; then cat $stderr >&2; rm -f $stdout $stderr; exit 1; fi
    rm -f $stdout $stderr
}

function install_git () {
	echo -e " <git> is not installed.\n" ; sleep 1
	echo -e "• Installing git. Please wait..." && sudo apt-get install -qq -o=Dpkg::Use-Pty=0 git -y > /dev/null
	if which git > /dev/null; then echo -e "✔ done!\n"
	else echo -e "  \nAn error occurred while installing 'git'... aborting installer :( \n" ; exit 1
	fi
}

function install_unlockme () {
	if which git > /dev/null; then
		echo -e "• Git cloning UnlockMe into /tmp/unlockme..." && cd /tmp
		quiet_git clone https://github.com/ralphys/unlockme && cd unlockme && echo -e "✔ done!\n"
	fi
	echo -e "• ${VARUPD} UnlockMe..." ; sleep .5
		cp -rf usr / && echo -e "✔ done!\n"
	echo -e "• Setting files and folders permissions..." ; sleep .5
		find /usr/share/unlockme -type d -print0 | xargs -0 chmod 755
		find /usr/share/unlockme -type f -print0 | xargs -0 chmod 644
		cd /usr/local/sbin
		chmod +x dryapt get_download unlockme-admin unlockme-appearance unlockme-apps 
		chmod +x unlockme-main unlock-req-install blockhosts icon-themes-erikdubois
		cd /usr/share/unlockme/tools/
		chmod +x unlockme-dropbox.sh uninstall.sh

	echo -e "✔ done!\n"

	while true; do
    	read -p "  Would you like to add UnlockMe shortcut to your Desktop (y/n)?" yn
    	case $yn in
        	[Yy]* ) yes | cp "/usr/share/applications/UnlockMe.desktop" "/home/$_ADMUSER/Desktop/"
					chown "$_ADMUSER":"$_ADMUSER" "/home/$_ADMUSER/Desktop/UnlockMe.desktop" ; sleep .5
					echo -e "✔ Shortcut created.\n" ; break ;;
        	[Nn]* ) echo -e "\n"; break ;;
        		* ) echo -e "\n  Please answer [Y]es or [N]o.\n" ;;
    	esac
	done
	echo -e " ${VARINST} completed."
	echo -e " -----------------------\n"
}

[[ -f "/usr/local/sbin/unlockme-main" ]] && VARINST="Update" VARUPD="Updating" || VARINST="Installation" VARUPD="Installing"

if which git > /dev/null; then
	install_unlockme
else
	if [[ -d "${_SOURCE}/usr/local/sbin" && -e "${_SOURCE}/usr/share/unlockme/icons" ]]; then
		echo -e "  Installing from current folder" && install_unlockme
	else 
		install_git ; install_unlockme
	fi
fi
exit 0


