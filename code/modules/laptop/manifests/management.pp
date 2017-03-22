class laptop::management {
  file { '/usr/local/bin/add-package':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/laptop/add-package',
  }
}
