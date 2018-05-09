# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=bleuzen-manjaro-kde-setup
pkgver=2018.05.09
pkgrel=1
pkgdesc="My Manjaro KDE setup"
arch=("x86_64")
url="https://github.com/Bleuzen/manjaro-kde-setup"
depends=("pamac"
         "pamac-tray-appindicator"
         "xdg-desktop-portal-gtk"
         "xdg-desktop-portal-kde"
         "flatpak"
         "rsync"
         "bash-completion"
         "wget"
         "zip"
         "frei0r-plugins"
         "xorg-xrandr"
         "yaourt"
         "htop"
         "flac" "lame" "vorbis-tools" "opus-tools")
optdepends=("powerpill"
            "pacserve"
            "chromium"
            "latte-dock"
            "gimp"
            "audacity"
            "obs-studio"
            "redshift" "plasma5-applets-redshift-control"
            "file-roller"
            "gparted" "gnome-disk-utility"
            "tk: git-cola gui fix"
            "gnome-calculator"
            "soundkonverter"
            "kid3"
            "zsh" "zsh-autosuggestions" "zsh-completions" "manjaro-zsh-config"
            "keepassxc"
            "adapta-gtk-theme" "adapta-kde" "kvantum-theme-adapta" "papirus-icon-theme"
            "libva-vdpau-driver"
            "android-file-transfer"
            "wine" "wine-mono" "wine_gecko" "winetricks"
            "pulseeffects"
            "youtube-dl"
            "telegram-desktop"
            "testdisk"
            "wireshark-qt"
            "lollypop"
            "kdenlive"
            "gstreamer-vaapi" "libvdpau-va-gl" "libva" "libva-vdpau-driver" "libva-intel-driver" "libva-mesa-driver")
conflicts=("octopi-notifier-frameworks")
install=$pkgname.install

package() {
  # Copy scripts
  mkdir -p "$pkgdir/usr/bin/"
  for file in "scripts/*"
  do
    install -m755 $file "$pkgdir/usr/bin/"
  done

  # Copy hotkeys
  mkdir -p "$pkgdir/usr/share/khotkeys/"
  install "bleuzensshortcuts.khotkeys" "$pkgdir/usr/share/khotkeys/"
}
