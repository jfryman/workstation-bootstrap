class arch::yubikey {
  package { ['pcsc-tools', 'ccid', 'libusb-compat']:
    ensure => present,
  }

  service { 'pcscd':
    ensure  => running,
    enable  => true,
    require => Package['pcsc-tools'],
  }
}
