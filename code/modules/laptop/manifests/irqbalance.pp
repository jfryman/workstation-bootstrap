class laptop::irqbalance {
  package { 'irqbalance':
    ensure => present,
  }

  service { 'irqbalance':
    enable  => true,
    ensure  => running,
    require => Package['irqbalance'],
  }
}
