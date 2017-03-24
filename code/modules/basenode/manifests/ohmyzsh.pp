class basenode::ohmyzsh {
  vcsrepo { '/home/jfryman/.oh-my-zsh':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/robbyrussell/oh-my-zsh.git',
  }
}
