# Copy to [your-github-username].pp
# Rename the class to
# people::[your-github-username]
# See also: https://github.com/cloudfour/cloudfour-boxen/wiki/Personal-Module-Recipes
class people::template_for_people_modules {


  ## Uncomment for our own "potions"
  # package { 'atom': provider => 'brewcask' }

  ## Uncomment for our own modules
  #
  # include teams::dev
  #
  # include mamppro

}
