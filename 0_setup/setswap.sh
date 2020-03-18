#!/bin/bash

echo ">> setup ip"

sudo echo -n ">> Press ENTER to continue.(Ctrl+C to exit)"
read flag

sudo dd if=/dev/zero of=/var/swapfile bs=1024 count=$((4*1024*1024))
sudo chmod 600 /var/swapfile
sudo mkswap /var/swapfile
sudo swapon /var/swapfile
sudo echo "/var/swapfile    nano    swap    swap    0    0" >> /etc/fstab

