class arch::keymap(
  $layout     = 'dvorak',
  $xkblayout  = 'us',
  $xkbmodel   = 'pc104',
  $xkbvariant = $layout,
) {
  file { '/etc/vconsole.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('arch/vconsole.conf.erb'),
  }

  file { '/etc/X11/xorg.conf.d/00-keyboard.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('arch/00-keyboard.conf.erb'),
  }
}
