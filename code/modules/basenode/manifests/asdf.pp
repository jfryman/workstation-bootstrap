class basenode::asdf(
  $version = 'v0.2.1',
) {
  vcsrepo { '/home/jfryman/.asdf':
    ensure   => present,
    provider => git,
    revision => $version,
    source   => 'https://github.com/asdf-vm/asdf.git',
    user     => 'jfryman',
  }
}
