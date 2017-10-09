#!/bin/bash

SCRIPT_VERSION="2017.09.17"

if [[ $EUID -ne 0 ]];
then
    exec sudo /bin/bash "$0" "$@"
fi

EXTRA_MODE=true

#TODO: if --extra

#TODO: extra-AUR mode

echo
echo " --- Manjaro post-install Skript ---"
echo "Version: $SCRIPT_VERSION"
echo "Extra Mode: $EXTRA_MODE"
echo



# Nur deutsche Server benutzen
pacman-mirrors --geoip

# Lokale Datenbank komplett neu aufbauen und aktualisieren
pacman -Syy



# update-mirrors-fasttrackSkript erstellen
echo "#!/bin/bash
if [[ \$EUID -ne 0 ]];
then
    exec sudo /bin/bash "\$0" "\$@"
fi

pacman-mirrors -f 10
pacman -Syy" > /usr/bin/update-mirrors-fasttrack
chmod +x /usr/bin/update-mirrors-fasttrack

# update-system-fasttrack powerpill Skript erstellen
echo "#!/bin/bash
if [[ \$EUID -ne 0 ]];
then
    exec sudo /bin/bash "\$0" "\$@"
fi

update-mirrors-fasttrack
powerpill --noconfirm -Su" > /usr/bin/update-system-powerpill
chmod +x /usr/bin/update-system-powerpill




# Base Pakete installieren
#TODO: use powerpill?
pacman --needed --noconfirm -S pamac pamac-tray-appindicator \
                               rsync \
                               bash-completion \
                               wget \
                               zip \
                               frei0r-plugins \
                               
# Extra Pakete installieren
#TOOD: Nur wenn extra boolean
#TODO: use powerpill?
pacman --needed --noconfirm -S powerpill \
                               chromium \
                               gimp \
                               kde-servicemenus-dropbox  \
                               redshift plasma5-applets-redshift-control  \
                               proguard  \
                               file-roller  \
                               gnome-calculator \
                               kid3 \
                               soundkonverter \
                               tk \
                               lame \
                               vorbis-tools \
                               opus-tools \
                               flac \
                               cryfs
                               
# Dropbox was dropped from the repo. Let's find a new way:
# https://www.dropbox.com/install
                               

# Octopi Notifier entfernen (durch Pamac ersetzt)
pacman --noconfirm -R octopi-notifier-frameworks

#TODO
# Vorübergehender Fix für Gnome Apps
pacman --noconfirm -S xdg-desktop-portal-gtk xdg-desktop-portal-kde


# System aktualisieren
update-system-powerpill

                                    
#TODO: Use Powerpill to install / update? But it downloads from multiple mirrors, so maybe different package snapshots. Maybe there would be version conflicts.

#TODO: Sprachpakete installieren

echo

echo "TODO: Compositor ändern:
Systemeinstellungen > Anzeige und Monitor > Compositor > Ausgabemodul -> OpenGL 3.1"

echo "TODO: sudo usermod -a -G vboxusers USER"

echo
read -p "Fertig. Enter drücken für Neustart ..."
reboot
