class arch::mbsync {
  file { "/etc/systemd/system/mbsync@.service":
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/arch/mbsync@.service',
  }
  file { "/etc/systemd/system/mbsync@.timer":
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/arch/mbsync@.timer',
  }

  service { "mbsync@jfryman.timer":
    ensure => running,
    enable => true,
  }
}
