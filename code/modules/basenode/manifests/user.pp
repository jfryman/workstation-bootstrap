class basenode::user{
  user { 'jfryman':
    ensure => present,
    shell  => '/usr/bin/zsh',
    groups => ['jfryman','wheel', 'network', 'audio', 'bumblebee', 'lp'],
  }

  group { 'jfryman':
    ensure => present,
  }

  $_dotfiles = lookup('dotfiles')
  $_dotfiles.each |String $_dotfile| {
    file { "/home/jfryman/${_dotfile}":
      ensure => symlink,
      target => "/home/jfryman/.dotfiles/${_dotfile}",
      force  => true,
      owner  => 'jfryman',
      group  => 'jfryman',
    }
  }
}
