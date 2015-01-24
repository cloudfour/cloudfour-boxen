# Copy to [your-github-username].pp
# Rename the class to
# people::[your-github-username]
class people::template_for_people_modules {
  ## Uncomment any of the following for the puppet-* module
  #
  # include iterm2::dev
  # OR
  # include iterm2::stable

  ## Uncomment for our own "potions"
  # include cloudfour_potions::atom
  # include cloudfour_potions::sublime_text
  # include cloudfour_potions::sublime_text2

  ## Uncomment for our own modules
  #
  # include teams::dev
  #
  # include mamppro

}
