# This is sublime text 3
class cloudfour_potions::sublime_text {
  include sublime_text
  nodejs::module { 'jscs for 0.10': module => 'jscs', node_version => 'v0.10' }
  # jshint is installed via the cloudfour module manifest

  sublime_text::package { 'editorconfig':
    source => 'sindresorhus/editorconfig-sublime'
  }

  sublime_text::package { 'csscomb':
    source => 'csscomb/sublime-csscomb'
  }

  sublime_text::package { 'SublimeLinter':
    source => 'SublimeLinter/SublimeLinter3'
  }

  sublime_text::package { 'Sublime​Linter-jshint':
    source => 'SublimeLinter/SublimeLinter-jshint'
  }

  sublime_text::package { 'Sublime​Linter-jscs':
    source => 'SublimeLinter/SublimeLinter-jscs'
  }
}
