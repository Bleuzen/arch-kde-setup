# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=bleuzen-manjaro-kde-setup
pkgver=2017.11.23
pkgrel=1
pkgdesc="My Manjaro KDE setup"
arch=("x86_64")
url="https://github.com/Bleuzen/manjaro-kde-setup"
depends=("pamac"
         "pamac-tray-appindicator"
         "xdg-desktop-portal-gtk"
         "xdg-desktop-portal-kde"
         "rsync"
         "bash-completion"
         "wget"
         "zip"
         "frei0r-plugins"
         "xorg-xrandr")
optdepends=("powerpill"
            "chromium"
            "latte-dock"
            "gimp"
            "audacity"
            "obs-studio"
            "redshift" "plasma5-applets-redshift-control"
            "proguard"
            "file-roller"
            "gparted"
            "tk"
            "gnome-calculator"
            "soundkonverter"
            "kid3"
            "lame"
            "vorbis-tools"
            "opus-tools"
            "flac"
            "flatpak"
            "zsh" "zsh-autosuggestions" "zsh-completions" "manjaro-zsh-config"
            "keepassxc"
            "adapta-gtk-theme" "adapta-kde" "kvantum-theme-adapta" "papirus-icon-theme"
            "plasma-vault" "cryfs"
            "libva-vdpau-driver")
conflicts=("octopi-notifier-frameworks")
install=$pkgname.install

package() {
  mkdir -p "$pkgdir/usr/bin/"

  install -D "scripts/update-mirrors-fasttrack" "$pkgdir/usr/bin/"
  install -D "scripts/restart-process" "$pkgdir/usr/bin/"
  
  # Permission example:
  #install -Dm644
}
