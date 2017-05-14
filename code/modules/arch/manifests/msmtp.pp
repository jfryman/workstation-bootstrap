class arch::msmtp {
  file { "/etc/systemd/system/msmtp-runqueue@.service":
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/arch/msmtp-runqueue@.service',
  }
  file { "/etc/systemd/system/msmtp-runqueue@.timer":
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/arch/msmtp-runqueue@.timer',
  }

  service { "msmtp-runqueue@jfryman.timer":
    ensure => running,
    enable => true,
  }
}
