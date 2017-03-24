class basenode::spacemacs {
  vcsrepo { '/home/jfryman/.emacs.d':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/syl20bnr/spacemacs.git',
  }
  
}
