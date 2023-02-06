#! /bin/bash

set -e
# Trap “Error at $LINENOE’ ERR
#############
if [[ $2 == "Test" || $2 == "InstallOnly" || $2 == "RemoveOnly" ]] && [[ $1 == "installScript" ]];
then
    ./Install\ Script.sh $2
    exit
fi
# sudo pacman-mirrors -g && sudo pacman -Syy
# sudo pacman -Syyu

if [[ $1 != "noInstallScript" ]];
then
    echo "Unrecogonized arguments. Please Check!!"
    exit
fi
echo Proceeding with no install script. Hope you have all the packages installed!
##############

# USE SUDO BEFORE!!
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# # Mounting Drives:
echo Mounting /dev/sda1...
sudo cat /run/media/devlinman/DATA/SOFTWARE/Programming/Configs/FSTAB/fstab >> /etc/fstab
echo -e "\n\tFSTAB CONFIG UPDATED!"
cat /etc/fstab
echo -e "\n"
systemctl daemon-reload
mkdir -p /media/DATA
mkdir /media/WINDOWS /media/SAFE /media/STORM
chown -R devlinman /media && sudo chgrp -R devlinman /media
umount /dev/sda1
mount -a
echo Mounted /dev/sda1 @ /media/DATA

gpasswd -a $USER input
# copy grub config and theme
cp /media/DATA/SOFTWARE/Programming/Configs/GRUB/grub /etc/default/grub
echo Copying Grub config and theme...

mv /usr/share/grub/themes/manjaro /usr/share/grub/themes/manjaro.bak          # Backup GRUB THEME

cp -r /media/DATA/SOFTWARE/Programming/Configs/GRUB/manjaro /usr/share/grub/themes


# sudo pacman -S git base-devel

# git clone https://aur.archlinux.org/update-grub.git

# yay -S update-grub


# sudo pacman -S git base-devel
update-grub

systemctl disable systemd-networkd-wait-online.service

###############################

###############################
# *
# cp /media/DATA/SOFTWARE/Programming/Configs/LIBINPUT\ GESTURES/libinput-gestures.conf /home/devlinman/.config/libinput-gestures.conf
# echo -e "Copied libinput-gestures config\nDont forget to autostart libinput-gestures!"
# libinput-gestures-setup autostart               # Must have LIBINPUT-Gestures Installed!

# *
# cp -r /media/DATA/SOFTWARE/Programming/Configs/NEOFETCH/neofetch/ /home/devlinman/.config/
# echo Copied neofetch configs.

# *
# cp /media/DATA/SOFTWARE/Programming/Configs/Vim/vimrc /home/devlinman/.vimrc
# echo copied vimrc.
# *
# cp /media/DATA/SOFTWARE/Programming/Configs/ZSH/zshrc /home/devlinman/.zshrc
# echo copied zshrc.
# sudo restart now
# zsh                 # Reload terminal
##################################
# # PACMAN Config
sed -i -e 's/#ParallelDownloads = 5/ParallelDownloads = 10/g' -e 's/#Color/Color\nILoveCandy/g' -e 's/#VerbosePkgLists/VerbosePkgLists/g' /etc/pacman.conf
###################################
# # # # # # # # # LINKING DIRECTORIES
Arr=("Desktop" "Documents" "Downloads" "Music" "Pictures" "Videos" "Telegram Desktop")
for key in "${Arr[@]}"
do
    rm -Rf "/home/devlinman/$key"
    ln -s "/media/DATA/$key" "/home/devlinman/$key"
    echo -e "/media/DATA/$key\t" ">>\t" "/home/devlinman/$key"
done
ln -s "/media/DATA/SOFTWARE/Linux/Applications" "/home/devlinman/Applications"
echo "Applications Folder Linked to ~"
####################################

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # ADDING SHUTDOWN SCRIPT

# sudo echo "devlinman ALL=(ALL) NOPASSWD: /sbin/shutdown" >> /etc/sudoers

# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # yet to do:

# extra
# add favorite applications to kickoff menu

# # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Help
# commandline arguments: I R T

# # # # # # # # # # # # # # # # # # # # #
# New Bug: SDDM config...
chown -R sddm:sddm /var/lib/sddm/.config

pamac install konsave
konsave -i Konsave.knsv
konsave -a Konsave
