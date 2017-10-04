#!/bin/bash
  # Print Pre-text Containing Script Version Info & Creator Info (please leave current credits intact and add a separate line if you modify the script & pass it on)
  clear
  echo "Backup Script"
  echo ""
  echo "V.1.3"
  echo ""
  echo "Created by Lonewaster@gmail.com"
  echo "VIVA LA LINUX!!!"
  echo ""
  read -p "Please Press ENTER To Continue..." waitForEnter
  # Alert The User & Wait 3 Clicks
  echo "BACKUP Initiating..."
  echo ""
  sleep 3
  # Ask The User For Their Current Username (For Backup File Placement & Permissions)
  read -p "What username are you currently logged into? (must be IDENTICAL to username you are currently using!!): " backupUser
  # Backup Entire System To the Specified User's homedir/backup.tgz (../../ included so script can be put in subdirectory)
  sudo tar cvpzf ../../home/$backupUser/backup.tgz --exclude=/proc --exclude=/lost+found --exclude=/backup.tgz --exclude=/mnt --exclude=/sys --exclude=/media /
  # Upon Completion Of Backup, Alert The User
  echo ""
  echo "BACKUP Complete!"
  echo ""
  # Then Set backup.tgz File Privilidges So That The Specified USER Can Read, Write & Execute
  echo "Setting Backup File Privilidges..."
  echo ""
  # Set The File's Group As the Specified $backupUser
  chgrp $backupUser ../../backup.tgz
  # Set Read, Write & Execute Privilidges For The Owner (root)
  chmod u+rwx ../../backup.tgz
  # Set Read, Write & Execute Privilidges For The Specified Group ($backupUser)
  chmod g+rwx ../../backup.tgz
  # Alert The User, Wait 3 Clicks & Terminate The Script
  echo "TERMINATING..."
  echo ""
  sleep 3
  # End Of Backup.sh Script