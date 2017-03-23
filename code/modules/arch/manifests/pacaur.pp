class arch::pacaur {
  Exec {
    path => [
      '/bin',
      '/sbin',
      '/usr/bin',
      '/usr/sbin',
      '/usr/bin/core_perl',
    ],
  }

  file { ['/usr/src/cower', '/usr/src/pacaur']:
    ensure => directory,
    owner  => 'jfryman',
    group  => 'root',
    mode   => '0775',
  }

  exec { 'download cower PKGBUILD':
    command => 'curl https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower -o PKGBUILD',
    cwd     => '/usr/src/cower',
    creates => '/usr/src/cower/PKGBUILD',
    require => File['/usr/src/cower'],
    notify  => Exec['build cower PKGBUILD'],
  }

  exec { 'download pacaur PKGBUILD':
    command => 'curl https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur -o PKGBUILD',
    cwd     => '/usr/src/pacaur',
    creates => '/usr/src/pacaur/PKGBUILD',
    require => File['/usr/src/pacaur'],
    notify  => Exec['build pacaur PKGBUILD'],
  }

  exec { 'build cower PKGBUILD':
    command     => 'makepkg PKGBUILD --skipinteg --install',
    cwd         => '/usr/src/cower',
    user        => 'jfryman',
    refreshonly => true,
    notify      => Exec['install cower PKGBUILD'],
  }

  exec { 'install cower PKGBUILD':
    command     => 'yes | pacman -U cower*.pkg.tar.xz',
    cwd         => '/usr/src/cower',
    refreshonly => true,
  }

  exec { 'build pacaur PKGBUILD':
    command     => 'makepkg PKGBUILD --skipinteg --install',
    cwd         => '/usr/src/pacaur',
    user        => 'jfryman',
    refreshonly => true,
    require     => Exec['build cower PKGBUILD'],
    notify      => Exec['install pacaur PKGBUILD'],
  }

  exec { 'install pacaur PKGBUILD':
    command     => 'yes | pacman -U pacaur*.pkg.tar.xz',
    cwd         => '/usr/src/pacaur',
    refreshonly => true,
  }
}
