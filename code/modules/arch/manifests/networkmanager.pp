class arch::networkmanager {
  $_nm_packages = ['networkmanager', 'networkmanager-openvpn', 'networkmanager-dispatcher-sshd',
                   'network-manager-applet', 'nm-connection-editor', 'xfce4-notifyd', 'dhclient',
                   'networkmanager-dispatcher-openntpd', 'dnsmasq']

  package { $_nm_packages:
    ensure => present,
  }

  file { '/etc/NetworkManager/NetworkManager.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/arch/NetworkManager.conf',
    require => Package[$_nm_packages],
  }

  file { '/etc/NetworkManager/dnsmasq.d/ipv6_listen.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/arch/ipv6_listen.conf',
    notify  => Service['NetworkManager'],
    require => Package[$_nm_packages],
  }

  service { 'NetworkManager':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/NetworkManager/NetworkManager.conf'],
  }

  service { 'NetworkManager-dispatcher':
    enable  => true,
    require => Package[$_nm_packages],
  }

  service { ['systemd-networkd', 'systemd-resolved']:
    ensure  => stopped,
    enable  => false,
    require => Package[$_nm_packages],
    before  => Service['NetworkManager'],
  }
}
