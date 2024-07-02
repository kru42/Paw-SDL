# Maintainer: kruniak <kruniak@protonmail.com>
pkgname=perl-paw-sdl
pkgver=0.01
pkgrel=1
pkgdesc="Paw SDL2"
arch=('any')
url="https://github.com/kruniak/Paw-SDL"
license=('Zlib')
depends=('perl' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('git' 'perl-module-build')
source=("git+https://github.com/kruniak/Paw-SDL.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Paw-SDL"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/Paw-SDL"
  perl Makefile.PL
  make
}

package() {
  cd "$srcdir/Paw-SDL"
  make install INSTALLDIRS=site DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:

