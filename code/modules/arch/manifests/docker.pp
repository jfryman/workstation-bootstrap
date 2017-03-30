class arch::docker {
  package { ['docker']:
    ensure => present,
  }

  service { 'docker':
    ensure  => running,
    enable  => true,
    require => Package['docker'],
  }
}
