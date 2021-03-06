#!/bin/bash
if [[ $EUID -ne 0 ]];
then
    exec sudo /bin/bash "$0" "$@"
fi


PACMAN_CONFIG="/etc/pacman.conf"
PACKAGES_TO_REMOVE="octopi octopi-notifier-frameworks octopi-repoeditor alpm-octopi-utils octopi-cachecleaner octopi-pacmanhelper yaourt appimagelauncher bauh snapd snapd-glib pamac-snap-plugin"
PACKAGES_TO_HARD_REMOVE="snapd"


remove_repo() {
    echo "[BMKS] Removing repo..."

    # Remove signing key
    pacman-key --delete 569B2F713B43893D63EF67ED37A897239F434732

    # Remove repo from pacman config
    sed -n '1h;1!H;${g;s/###REPO bleuzen###\n.*###END REPO bleuzen###//;p;}' -i $PACMAN_CONFIG
    # Delete all trailing blank lines at end of file
    sed -e :a -e '/^\n*$/{$d;N;};/\n$/ba' -i $PACMAN_CONFIG
}


add_repo() {
echo "[BMKS] Adding repo..."

# Add public key used for signing
# Updates for this are handled by the package 'bleuzen-keyring'
pacman-key --add - <<KEY
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=S+T4
-----END PGP PUBLIC KEY BLOCK-----
KEY

# https://wiki.archlinux.org/index.php/Pacman/Package_signing#Adding_unofficial_keys
# Sign the imported key
pacman-key --lsign-key 569B2F713B43893D63EF67ED37A897239F434732

# Edit pacman config
# Updates for this are handled by the package 'bleuzen-repo'
cat >> $PACMAN_CONFIG <<-EOF

###REPO bleuzen###
[bleuzen]
SigLevel = PackageRequired
Server = https://bleuzen.github.io/arch-repo/\$repo/\$arch
Server = https://bleuzen.de/repo/manjaro/\$repo/\$arch
###END REPO bleuzen###
EOF
}


remove_crap() {
    echo "[BMKS] Removing crap packages..."
    
    for package in $PACKAGES_TO_HARD_REMOVE; do
        pacman -R --noconfirm $package
    done
    
    pacman -D --asdeps $PACKAGES_TO_REMOVE &>/dev/null
    pacman -Rns --noconfirm $(pacman -Qqtd)
}


if [ "$1" == "--remove" ]; then
    echo "[BMKS] Removing..."
    pacman -R bleuzen-keyring bleuzen-repo bleuzen-manjaro-kde-setup
    remove_repo
    pacman -Syy
else
    echo "[BMKS] Installing..."

    # Remove packages I don't like
    remove_crap

    # Install the repo and basic setup packages
    add_repo
    pacman -Syy
    pacman -S --noconfirm bleuzen-keyring bleuzen-repo bleuzen-manjaro-kde-setup
    
    # Install LibreOffice
    if [ "$1" == "--no-office" ]; then
        echo "[BMKS] Skipping installation of LibreOffice"
    else
        pacman -S --noconfirm libreoffice-still libreoffice-still-de
    fi
fi


echo "[BMKS] Done."
