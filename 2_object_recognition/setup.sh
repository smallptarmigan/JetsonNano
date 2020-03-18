#!/bin/bash

git clone --recursive https://github.com/dusty-nv/jetson-interence.git

cd jetson-interence
madir build
cd build
cmake ../

make

