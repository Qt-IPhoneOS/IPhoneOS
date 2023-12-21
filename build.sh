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

