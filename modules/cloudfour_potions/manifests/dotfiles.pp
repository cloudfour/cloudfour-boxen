class cloudfour_potions::dotfiles {
  # .editorconfig
  file { "/Users/${::luser}/.editorconfig":
    source => 'puppet:///modules/cloudfour_potions/dotfiles/editorconfig',
  }

  # .csscomb.json
  file { "/Users/${::luser}/.csscomb.json":
    source => 'puppet:///modules/cloudfour_potions/dotfiles/csscomb.json',
  }

  # .jscsrc
  file { "/Users/${::luser}/.jscsrc":
    source => 'puppet:///modules/cloudfour_potions/dotfiles/jscsrc',
  }

  # .jshintrc
  file { "/Users/${::luser}/.jshintrc":
    source => 'puppet:///modules/cloudfour_potions/dotfiles/jshintrc',
  }

}
