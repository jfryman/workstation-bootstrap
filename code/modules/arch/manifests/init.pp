class arch {
  include ::arch::docker
  include ::arch::keymap
  include ::arch::pacaur
  include ::arch::aur
  include ::arch::networkmanager
  include ::arch::zeroconf
  include ::arch::dkms
  include ::arch::i3
  include ::arch::bluetooth
}
