class arch::dkms {
  package { ['dkms']:
    ensure => present,
  }
}
