#!/bin/bash
TMP_DIR=$(mktemp --directory)
cd $TMP_DIR
curl -OJL https://raw.githubusercontent.com/Bleuzen/manjaro-kde-setup/master/install.sh
chmod u+rx install.sh
if [ "$1" == "--no-office" ]; then
    bash install.sh --no-office
else
    bash install.sh
fi
rm -r $TMP_DIR
