class arch::i3 {
  file { '/usr/local/bin/i3-combine-config':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/arch/i3-combine-config',
  }
  file { '/usr/local/bin/i3-reload-combine-config':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/arch/i3-reload-combine-config',
  }
}
