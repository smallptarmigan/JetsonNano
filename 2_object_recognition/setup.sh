#!/bin/bash

git clone --recursive https://github.com/dusty-nv/jetson-inference.git

cd jetson-interence
mkdir build
cd build
cmake ../

make

