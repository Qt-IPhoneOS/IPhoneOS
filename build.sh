#!/bin/bash

cd Services
rm -rf build
mkdir build
cd build
cmake ..
make

cd ../../Apps/UICommon
rm -rf build
mkdir build
cd build
~/Qt/6.5.3/gcc_64/bin/qmake6 ..
make

cd ../../../MiddlewareLayer
rm -rf build
mkdir build
cd build
~/Qt/6.5.3/gcc_64/bin/qmake6 ..
make

cd ../../Apps/Phone
rm -rf build
mkdir build
cd build
~/Qt/6.5.3/gcc_64/bin/qmake6 ..
make
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/projects/IPhoneOS/Executable/
export LD_LIBRARY_PATH
./Phone









#!/bin/bash
if [ "$#" -eq 1 ]; then
    tool=$1
else
    read -rp "Choose build tools qmake[q] or cmake[c] ? " tool
fi
case $tool in 
    q*) 
        tool=qmake
    ;;
    c*)
        tool=cmake
esac
version=$(ls ~/Qt/ | grep "[0-9]")
if [[ "${tool}" == "cmake" ]]; then
    buildtool="cmake .. -DQT_VERSION=${version}"
elif [[ "${tool}" == "qmake" ]]; then
    buildtool="$HOME/Qt/6.5.3/gcc_64/bin/qmake6 ${PWD}/application_sample.pro"
fi


if [ -n "${buildtool}" ]; then
    rm -rf build || exit
    mkdir -p build || exit 
    cd build || exit
    eval "${buildtool}" 
    make -j8
fi

