class laptop::tlp {
  $_tlp_packages = ['tlp', 'tp_smapi', 'acpi_call', 'tlp-rdw']
  $_tlp_services = ['tlp', 'tlp-sleep']

  package { $_tlp_packages:
    ensure => present,
  }

  service { $_tlp_services:
    enable  => true,
    require => Package[$_tlp_packages],
  }
}
