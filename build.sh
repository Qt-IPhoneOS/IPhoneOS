#!/bin/bash

cd libs/Services
rm -rf build
mkdir build
cd build
cmake ..
make

cd ../../UICommon
rm -rf build
mkdir build
cd build
~/Qt/6.5.3/gcc_64/bin/qmake6 ..
make

cd ../../MiddlewareLayer
rm -rf build
mkdir build
cd build
~/Qt/6.5.3/gcc_64/bin/qmake6 ..
make

cd ../../../apps/Phone
rm -rf build
mkdir build
cd build
~/Qt/6.5.3/gcc_64/bin/qmake6 ..
make
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/projects/IPhoneOS/executable/
export LD_LIBRARY_PATH
./Phone


