class macbookpro::trackpad {
  file { '/etc/X11/xorg.conf.d/50-mtrack':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/macbookpro/50-mtrack.conf',
  }
}
