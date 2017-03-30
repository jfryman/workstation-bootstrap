class laptop::thermald {
  package { 'thermald':
    ensure => present,
  }

  service { 'thermald':
    enable  => true,
    ensure  => running,
    require => Package['thermald'],
  }
}
