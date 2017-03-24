class basenode::user{
  user { 'jfryman':
    ensure => present,
    shell  => '/usr/bin/zsh',
    groups => ['wheel', 'network', 'audio', 'bumblebee', 'lp'],
  }

  $_dotfiles = lookup('dotfiles')
  $_dotfiles.each |String $_dotfile| {
    file { "/home/jfryman/${_dotfile}":
      ensure => symlink,
      target => "/home/jfryman/.dotfiles/${_dotfile}",
      force  => true,
    }
  }
}
