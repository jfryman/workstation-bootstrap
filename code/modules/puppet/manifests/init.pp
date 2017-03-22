class puppet {
  package { 'puppet':
    ensure => 'present',
  }

  file { '/usr/local/bin/run-puppet':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/puppet/run-puppet',
  }
}
