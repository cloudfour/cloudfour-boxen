# This is sublime text 3
class cloudfour_potions::sublime_text {
  include sublime_text
  sublime_text::package { 'editorconfig':
    source => 'sindresorhus/editorconfig-sublime'
  }
}
