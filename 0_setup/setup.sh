#!/bin/bash

sudo apt update

# Install pip
sudo apt -y install python3-pip

# Update pip
pip3 install -U pip

# install pacages
sudo pip3 install -U numpy==1.16.1

# install tensorflow + keras
pip3 install --no-cache-dir --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==1.13.1+nv19.4 --user

