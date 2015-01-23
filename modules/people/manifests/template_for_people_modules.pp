# Copy to [your-github-username].pp
# Rename the class to
# people::[your-github-username]
class people::template_for_people_modules {
  ## Uncomment any of the following for the puppet-* module
  # include atom
  # include sublime_text
  # include iterm2

  ## Uncomment for our own modules
  #
  # include teams::dev
  #
  # include mamppro

}
