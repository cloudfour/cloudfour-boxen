class cloudfour_potions::sublime_text2 {
  include sublime_text::v2
  sublime_text::v2::package { 'editorconfig':
    source => 'sindresorhus/editorconfig-sublime'
  }
}
