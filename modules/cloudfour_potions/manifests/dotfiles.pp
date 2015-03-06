class cloudfour_potions::dotfiles {
  # .editorconfig
  file { "${home_directory}/.editorconfig":
    source => 'puppet:///modules/cloudfour_potions/dotfiles/editorconfig',
  }
}
