#! /bin/bash

set -e
# Trap “Error at $LINENOE’ ERR


#############


if [[ $1 == "T" ]] || [[ $1 == "I" ]] || [[ $1 == "R" ]];
then
    ./Install\ Script.sh $1
    exit
fi

# sudo pacman-mirrors -g && sudo pacman -Syy

sudo pacman -Syyu

./Install\ Script.sh $1

##############

# # Mounting Drives:

sudo cat /run/media/devlinman/DATA/SOFTWARE/Programming/Configs/FSTAB/fstab >> /etc/fstab
echo -e "\n\tFSTAB CONFIG UPDATED!"
sudo cat /etc/fstab
echo -e "\n"
sudo systemctl daemon-reload
sudo mkdir -p /media/DATA
sudo mkdir /media/WINDOWS /media/SAFE /media/STORM
sudo chown -R devlinman /media && sudo chgrp -R devlinman /media
sudo umount /dev/sda1
sudo mount -a

sudo gpasswd -a $USER input

# copy grub config and theme
sudo cp /media/DATA/SOFTWARE/Programming/Configs/GRUB/grub /etc/default/grub

# mv /usr/share/grub/themes/manjaro /usr/share/grub/themes/manjaro.bak          # Backup GRUB THEME

sudo cp -r /media/DATA/SOFTWARE/Programming/Configs/GRUB/manjaro /usr/share/grub/themes

sudo update-grub

systemctl disable systemd-networkd-wait-online.service

###############################

###############################

# copy libinput config and Autostart:

cp /media/DATA/SOFTWARE/Programming/Configs/LIBINPUT\ GESTURES/libinput-gestures.conf /home/devlinman/.config/libinput-gestures.conf

libinput-gestures-setup autostart               # Must have LIBINPUT-Gestures Installed!

# copy nefetch config:

cp -r /media/DATA/SOFTWARE/Programming/Configs/NEOFETCH/neofetch/ /home/devlinman/.config/

# copy vimrc:

cp /media/DATA/SOFTWARE/Programming/Configs/Vim/vimrc /home/devlinman/.vimrc

# copy zshrc:

cp /media/DATA/SOFTWARE/Programming/Configs/ZSH/zshrc /home/devlinman/.zshrc

# sudo restart now

zsh                 # Reload terminal


##################################
# # PACMAN Config

sudo sed -i -e 's/#ParallelDownloads = 5/ParallelDownloads = 10/g' -e 's/#Color/Color/g' -e 's/#VerbosePkgLists/VerbosePkgLists/g' /etc/pacman.conf

sudo echo "ILoveCandy" >> /etc/pacman.conf


###################################

# # # # # # # # # LINKING DIRECTORIES

Arr=("Desktop" "Documents" "Downloads" "Music" "Pictures" "Videos" "Telegram Desktop")

for key in "${Arr[@]}"
do
    ln -s "/media/DATA/$key" "/home/devlinman/Test/$key"
    echo -e "/media/DATA/$key\t" ">>\t" "/home/devlinman/$key"
done

echo "Applications Folder Linked to ~"
ln -s "/media/DATA/SOFTWARE/Linux/Applications" "/home/devlinman/Test/Applications"

####################################

# # # # # ADDING SHUTDOWN SCRIPT

# sudo echo "devlinman ALL=(ALL) NOPASSWD: /sbin/shutdown" >> /etc/sudoers



# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # yet to do:
# Add konsave to apply customizations
# custom shortcuts

# extra
# add favorite applications to kickoff menu

# # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Help
# commandline arguments: I R T

# # # # # # # # # # # # # # # # # # # #

# # Configure Terminal Prompt
p10k configure

# Copy config to p10k
