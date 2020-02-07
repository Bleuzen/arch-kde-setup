#!/bin/bash


_is_package_installed() {
    package="$1";
    check="$(LC_ALL=C pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}


# Switch from libreoffice-fresh to libreoffice-still
if [[ $(_is_package_installed "libreoffice-fresh") == 0 ]]; then
    echo "[BMKS] Switching to LibreOffice still"
    rm /var/lib/pacman/db.lck
    pacman -R --noconfirm libreoffice-fresh-de
    pacman -R --noconfirm libreoffice-fresh
    pacman -S --noconfirm libreoffice-still libreoffice-still-de
    touch /var/lib/pacman/db.lck
fi


# Add the Flathub repository (if flatpak is installed)
if [ -f "/usr/bin/flatpak" ]; then
    /usr/bin/flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi


# Enable pacredir service // TODO: also add pacredir entries in /etc/pacman.conf
# if [ -f "/usr/bin/pacredir" ]; then
#     systemctl enable pacserve.service
#     systemctl enable pacredir.service
#     echo "[BMKS] Enabled pacredir service"
# fi


# Enable TeamViewer daemon if it is installed
# currently commented out because teamviewer daemon increases boot time and I only rarely need it
# if [ -d "/opt/teamviewer/" ]; then
#     systemctl enable teamviewerd
#     echo "[BMKS] Enabled TeamViewer daemon"
# fi
