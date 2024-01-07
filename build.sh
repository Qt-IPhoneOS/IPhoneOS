#!/bin/bash

folder_path="${PWD}/libs/Services/build"
file_to_check="${PWD}/libs/Services/CMakeLists.txt"

rm -rf build
mkdir build
cd build
mkdir executable
cd ..

if [ -d "$folder_path" ]; then
    cd libs/Services/build
    make
    cd ../../..
else
    cd libs/Services
    mkdir build
    cd build
    cmake ..
    make
    cd ../../..
fi

version=$(ls ~/Qt/ | grep "[0-9]")
buildtool="$HOME/Qt/${version}/gcc_64/bin/qmake6 ${PWD}/IPhoneOS.pro"


if [ -n "${buildtool}" ]; then
    cd build || exit
    eval "${buildtool}" 
    make -j8
fi

