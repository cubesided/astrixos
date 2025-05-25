#!/bin/bash


# SCRIPT TO BE USED FOR PROTOTYPING!!!!
# OSVER = "OSr1" # Revision Name / OS Name
# bnm = 1 # Version Number
# dmy = 25525 # Build date
# OSBB = "$OSVER wrap.$bnm $dmy"

mkdir instcache
clear
echo cubesided OSr1 Installation Script
echo "Installation might take 15-20 minutes"
echo "(cubesided Astrix® 3600, cubesided OSr1 wrap.1 25525)"
echo ----------------------------------------------------------------------
sleep 5
# hope this works :D
if [ "$EUID" -ne 0 ]
      then 
            echo "To install OSr1, sudo is needed."
            # echo "Error, please insert your password:"
            sudo ls /root
            if [ "$EUID" -ne 0 ]
                then
                    echo -e "\nCould not authenticate the user."
                    echo -e "installation will now quit."
                    exit    
            else
            echo thank you.
            wait 2
            fi
    else
    sudo apt update
    echo installing packages, please wait.....
    sudo apt --assume-yes -qq install sway xorg xwayland gnome-terminal nemo
    sudo apt --assume-yes -qq install waybar rofi git autofs x2gothinclient-usbmount subversion
    sudo apt --assume-yes -qq install gdm3 --no-install-recommends # NO GNOME PLS
    sudo apt --assume-yes purge foot
    sudo systemctl enable gdm3
    sudo systemctl set-default graphical.target
    sleep 2
    clear
    echo configuring your experience, please wait.....
    echo
    cd instcache
    wget https://github.com/cubesided/astrixos/releases/download/25525/r1conf-deb12.tar.gz -O conf.tar.gz
    tar -xvf conf.tar.gz
    cd cn
    #sudo cp ./cmdline.txt /boot/firmware/cmdline.txt
    sudo echo " usbhid.mousepoll=0" >> /boot/firmware/cmdline.txt
    cp -r ./rofi $(eval echo ~"$SUDO_USER")/.config/rofi
    sudo cp -r ./waybar /etc/xdg/
    sudo cp -r ./sway /etc/
    cd ..
    sleep 2
    clear
    echo Your device will now restart.
    echo If you are running on a Raspberry Pi, there might be some gui issues
    echo use raspi-config at boot to fix any errors found.
    echo -----------------------------------------------------------------------------
    echo Any configuration errors should be reported to the OSr1 Repo.
    echo Waiting 10 sec.
    sleep 10
    # Remove install cache
    cd ..
    sudo rm -r ./instcache
    sudo reboot
fi
