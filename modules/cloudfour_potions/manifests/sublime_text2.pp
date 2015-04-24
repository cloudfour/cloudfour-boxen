class cloudfour_potions::sublime_text2 {
  include sublime_text::v2
  nodejs::module { 'jscs for 0.10': module => 'jscs', node_version => 'v0.10' }
  # jshint gets installed by cloudfour module manifest

  sublime_text::v2::package { 'editorconfig':
    source => 'sindresorhus/editorconfig-sublime'
  }

  sublime_text::v2::package { 'csscomb':
    source => 'csscomb/sublime-csscomb'
  }

  sublime_text::v2::package { 'SublimeLinter':
    source => 'SublimeLinter/SublimeLinter3'
  }

  sublime_text::v2::package { 'Sublime​Linter-jshint':
    source => 'SublimeLinter/SublimeLinter-jshint'
  }

  sublime_text::v2::package { 'Sublime​Linter-jscs':
    source => 'SublimeLinter/SublimeLinter-jscs'
  }
}
