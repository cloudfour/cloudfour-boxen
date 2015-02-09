# Copy to [your-github-username].pp
# Rename the class to
# people::[your-github-username]
# See also: https://github.com/cloudfour/cloudfour-boxen/wiki/Personal-Module-Recipes
class people::saralohr {

  include cloudfour_potions::atom
  notice("Hi there, Sara!")

}
