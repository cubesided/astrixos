#!/bin/bash

export OSVER = "OSr1"

if [ "$EUID" -ne 0 ]
      then 
            echo "To install $OSVER, sudo is needed."
            echo "Error, please insert your password:"
            sudo ls /root
            if [ "$EUID" -ne 0 ]
                then
                    echo -e "\nCould not authenticate the user."
                    echo -e "$OSVER installation will now quit."
                    exit    
            else
            echo thank you.
            wait 2
            fi
    else
    clear
    echo installing packages, please wait.....
    sudo apt -qq install swaywm
    sudo apt -qq install polybar
    sudo apt -qq install nitrogen
    nitrogen /usr/share/backgrounds
    clear
    echo Your device will now restart.
    echo If you are running on a Raspberry Pi, there might be some gui issues
    echo use raspi-config at boot to fix any errors found.
    echo -----------------------------------------------------------------------------
    echo Any configuration errors should be reported to cubesided admin.
    sleep 5
    sudo reboot
fi;;
