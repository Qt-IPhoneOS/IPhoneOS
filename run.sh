#!/bin/sh
version=$(ls ~/Qt/ | grep "[0-9]")
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PWD}/build/executable/
export LD_LIBRARY_PATH
QT_PLUGIN_PATH=$HOME/Qt/${version}/gcc_64/plugins${QT_PLUGIN_PATH:+:$QT_PLUGIN_PATH}
export QT_PLUGIN_PATH
exec $PWD/build/apps/Home/Home -c "$PWD"/build/am-config.yaml "$@"

