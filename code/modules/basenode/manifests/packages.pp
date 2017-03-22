class basenode::packages {
  $_packages = lookup('packages')
  package { $_packages:
    ensure => present,
  }
}
