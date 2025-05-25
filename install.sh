#!/bin/bash

# SCRIPT TO BE USED FOR PROTOTYPING!!!!
# OSVER = "OSr1" # Revision Name / OS Name
# bnm = 1 # Version Number
# dmy = 25525 # Build date
# OSBB = "$OSVER wrap.$bnm $dmy"

echo cubesided OSr1 Installation Script
# echo ($OSBB)
echo ----------------------------------------------

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
    clear
    echo installing packages, please wait.....
    sudo apt -qq install sway xorg xwayland
    sudo apt -qq install waybar
    sudo apt -qq install git
    sudo apt -qq install backman
    sudo apt -qq install gdm3
    sudo systemctl enable gdm3
    clear
    sudo systemctl set-default graphical.target
    echo Your device will now restart.
    echo If you are running on a Raspberry Pi, there might be some gui issues
    echo use raspi-config at boot to fix any errors found.
    echo -----------------------------------------------------------------------------
    echo Any configuration errors should be reported to the OSr1 Repo.
    echo Waiting 10 sec.
    sleep 10
    sudo reboot
fi
