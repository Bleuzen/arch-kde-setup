#!/bin/bash
TMP_DIR=$(mktemp --directory)
cd $TMP_DIR
curl -OJL https://raw.githubusercontent.com/Bleuzen/manjaro-kde-setup/master/install.sh
chmod u+rx install.sh
bash install.sh "$@"
rm -r $TMP_DIR
