#!/bin/bash
TMP_DIR=$(mktemp --directory)
cd $TMP_DIR
wget https://github.com/Bleuzen/manjaro-kde-setup/archive/master.tar.gz
tar -xzvf master.tar.gz
cd manjaro-kde-setup-master/bleuzen-manjaro-kde-setup
makepkg -si
