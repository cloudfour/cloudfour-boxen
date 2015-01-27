class people::lyzadanger {
  $HOME = "/Users/${::boxen_user}"
  include teams::dev
  include iterm2::dev

  include mamppro
  include cloudfour_potions::atom
  notice("Hi, future Lyza, from past Lyza")

  package {
    ['mongodb']:
  }

  #
  # DOTFILES
  #  - install and use homeshick for managing dotfiles
  #  - install my dotfiles
  # Inspired by https://github.com/mroth/my-boxen/blob/master/modules/people/manifests/mroth.pp
  #
  repository { 'homeshick':
    source => 'andsens/homeshick',
    path   => "${HOME}/.homesick/repos/homeshick"
  }
  -> repository { 'lyzadanger-dotfiles':
    source => 'https://github.com/lyzadanger/dotfiles.git',
    path   => "${HOME}/.homesick/repos/dotfiles",
    notify => Exec['link-dotfiles']
  }

  exec { 'link-dotfiles':
    command     => "bash -c 'source ${HOME}/.homesick/repos/homeshick/homeshick.sh; homeshick link dotfiles --force'",
    refreshonly => true
  }
}
