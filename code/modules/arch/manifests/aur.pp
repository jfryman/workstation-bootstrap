class arch::aur {
  $_packages = lookup('aur_packages')

  $_packages.each |String $package| {
    exec { "Install $package":
      command     => "pacaur -Sy $package",
      user        => 'jfryman',
      path        => [
        '/bin',
        '/sbin',
        '/usr/bin',
        '/usr/sbin',
      ],
      environment => [
        'HOME=/home/jfryman',
      ],
      timeout => 0,
      require => Class['::arch::pacaur'],
      unless  => "pacman -Q $package",
    }
  }
}
