# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=xdg-break-git
_pkgname=xdg-break
pkgver=r8.17689c9
pkgrel=1
pkgdesc="Script that sends a notification to remind you to take a break"
arch=('any')
url="https://github.com/thebitstick/xdg-break"
license=('GPL3')
depends=('fish' 'libnotify')
makedepends=('git')
provides=('xdg-break')
conflicts=('xdg-break')
source=('git+https://github.com/thebitstick/xdg-break')
sha512sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D -t "$pkgdir/usr/bin" "${_pkgname}/xdg-break.fish"
	install -D -t "$pkgdir/usr/share/applications" "${_pkgname}/xdg-break.desktop"
	mv "$pkgdir/usr/bin/xdg-break.fish" "$pkgdir/usr/bin/xdg-break"
} 
