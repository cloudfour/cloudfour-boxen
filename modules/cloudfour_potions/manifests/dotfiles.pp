class cloudfour_potions::dotfiles {
  # .editorconfig
  file { "/Users/${::luser}/.editorconfig":
    source => 'puppet:///modules/cloudfour_potions/dotfiles/editorconfig',
  }
}
