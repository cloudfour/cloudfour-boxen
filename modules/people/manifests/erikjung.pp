class people::erikjung {
  include teams::dev
  include phantomjs::1_9_0
  include cloudfour_potions::dotfiles

  package {
    'pandoc': ensure => installed
  }

  # Set the global version of PhantomJS (version should be installed already)
  phantomjs::global { '1.9.0': }

  notice('Hullo, Erik, thanks for making coffee!')
}
