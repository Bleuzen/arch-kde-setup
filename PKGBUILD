# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=bleuzen-manjaro-kde-setup
pkgver=2017.09.17
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
         "frei0r-plugins")
optdepends=("powerpill"
            "chromium"
            "gimp"
            "redshift"
            "plasma5-applets-redshift-control"
            "proguard"
            "file-roller"
            "tk"
            "gnome-calculator"
            "soundkonverter"
            "kid3"
            "lame"
            "vorbis-tools"
            "opus-tools"
            "flac")
conflicts=("octopi-notifier-frameworks")
install=$pkgname.install
source=("scripts.zip")
md5sums=("eddbeb62a2b79912ee49a93c9590fb24")

package() {
  mkdir -p "$pkgdir/usr/bin/"

  install -D "scripts/update-mirrors-fasttrack" "$pkgdir/usr/bin/"
  
  # Permission example:
  #install -Dm644
}
