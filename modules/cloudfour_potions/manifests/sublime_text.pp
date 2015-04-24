# This is sublime text 3
class cloudfour_potions::sublime_text {
  include sublime_text

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
