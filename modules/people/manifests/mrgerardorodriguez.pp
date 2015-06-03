# Copy to [your-github-username].pp
# Rename the class to
# people::[your-github-username]
# See also: https://github.com/cloudfour/cloudfour-boxen/wiki/Personal-Module-Recipes
class people::mrgerardorodriguez {

  include cloudfour_potions::dotfiles
  include cloudfour_potions::sublime_text2
  include cloudfour_potions::atom
  include iterm2::dev
  include teams::dev
  
  notice("Hullo, Mr. Gerardo!")

}
