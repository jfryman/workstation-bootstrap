class arch::bluetooth {
  $_bt_packages = ['pulseaudio-alsa', 'pulseaudio-bluetooth', 'blueman',
                   'bluez', 'bluez-libs', 'bluez-utils', 'bluez-firmware']

  package { $_bt_packages:
    ensure => present,
  }

  service { 'bluetooth':
    ensure => running,
    enable => true,
    require => Package[$_bt_packages],
  }
}
