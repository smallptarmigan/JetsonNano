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
sudo echo "gateway 192.168.1.254" >> /etc/network/interfaces.d/network
sudo echo "dns-nameservers 192.168.0.1,8.8.8.8" >> /etc/network/interfaces.d/network

# auto lo
# iface lo inet loopback
# auto eth0
# iface eth0 inet static
# address 192.168.1.100
# netmask 255.255.255.0
# gateway 192.168.1.254
# dns-nameservers 192.168.0.1,8.8.8.8