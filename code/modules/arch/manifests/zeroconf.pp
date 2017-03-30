class arch::zeroconf {
  $_zeroconf_packages = ['avahi', 'nss-mdns']

  package { $_zeroconf_packages:
    ensure => present,
  }

  file { '/etc/nsswitch.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/arch/nsswitch.conf',
  }
 
  service { 'avahi-daemon':
    ensure  => running,
    enable  => true,
    require => File['/etc/nsswitch.conf'],
  }
}
