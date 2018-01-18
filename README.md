# UnlockMe
Bash script App based on Yad and Zenity for Linux Mint Cinnamon, MATE, Xfce and Linux Lite

## Supports

- Linux Mint Cinnamon 18.x (xenial)
- Linux Mint MATE 18.x (xenial)
- Linux Mint Xfce 18.x (xenial)
- Linux Lite 3.x (xenial)

-- NOTE: Ubuntu Budgie Remix (xenial)
   I'm slowly checking scripts under Ubuntu Budgie.
   
 - Applications under "Application Software" installation section (see screenshot #2 below) do not install properly in Ubuntu Budgie.
   Mostly, there are issues with installations in adding/removing repositories based on what's added to
   /etc/apt/sources.list and /etc/apt/sources.list.d/ by some applications.

   IF YOU ARE NOT WILLING TO REPORT AN ISSUE OR WORK YOUR WAY AROUND TO FIX ISSUES, DO NOT INSTALL IN UBUNTU BUDGIE.
   
   THESE SCRIPTS WERE ORIGINALLY PUT TOGETHER TO RUN IN LINUX MINT.

   With that said, I will keep on adding and updating the scripts to work on Ubuntu Budgie as time allows.
   This note will be removed once all scripts are properly tested in Ubuntu Budgie. 


![](https://i.imgur.com/pg69J8n.png)

![](https://i.imgur.com/0BP6DL1.png)


# UnlockMe
## License ![License](https://img.shields.io/badge/license-GPLv2-green.svg)
Bash script App based on Yad and Zenity for Linux Mint Cinnamon, MATE, Xfce and Linux Lite

## Authors
- [Ralphy](https://github.com/ralphys)

## Installation Instructions

 - Will create install and uninstall scripts later, for now:

 1 - Copy UnlockMe.desktop shortcut to your desktop or any other location you wish. E.g.:
 
   $ cd unlockme-master && cp UnlockMe.desktop $HOME/Desktop

 2 - Copy folder "usr" to your / :
 
 	 $ cd unlockme-master && sudo cp -R usr /

 3 - Make scripts executable:
 
 	$ cd /usr/local/sbin && sudo chmod +x dryapt get_download unlockme-admin unlockme-appearance unlockme-apps unlockme-main unlock-req-install
   
 	$ cd /usr/share/unlockme/tools && sudo chmod +x unlockme-dropbox.sh
 	
 4 - Launch UnlockMe.desktop :)

![](https://i.imgur.com/Whf8vUj.png)

![](https://i.imgur.com/Ign4zXl.png)

![](https://i.imgur.com/mU8fZzt.png)

![](https://i.imgur.com/wwsM7h0.png)