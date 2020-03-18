#!/bin/bash

git clone --recursive https://github.com/dusty-nv/jetson-inference.git

mkdir jetson-interence/build
cmake jetson-interence

make

