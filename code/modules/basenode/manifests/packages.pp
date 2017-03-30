class basenode::packages {
  $_packages = lookup('packages', {merge => 'unique'})

  package { $_packages:
    ensure => present,
  }
}
