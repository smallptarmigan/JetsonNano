#!/bin/bash

echo ">> setup ip"

sudo echo -n ">> Press ENTER to continue.(Ctrl+C to exit)"
read flag

sudo touch /etc/network/interfaces.d/network

sudo echo "auto lo" >> /etc/network/interfaces.d/network
sudo echo "iface lo inet loopback" >> /etc/network/interfaces.d/network
sudo echo "auto eth0" >> /etc/network/interfaces.d/network
sudo echo "iface eth0 inet static" >> /etc/network/interfaces.d/network
sudo echo "address 192.168.1.100" >> /etc/network/interfaces.d/network
sudo echo "netmask 255.255.255.0" >> /etc/network/interfaces.d/network
sudo echo "gateway 192.168.0.1" >> /etc/network/interfaces.d/network
sudo echo "dns-nameservers 192.168.0.1,8.8.8.8" >> /etc/network/interfaces.d/network
