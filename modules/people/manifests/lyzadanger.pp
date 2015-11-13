class people::lyzadanger {
  include cloudfour_potions::dotfiles
  $HOME = "/Users/${::boxen_user}"
  include teams::dev
  include iterm2::dev

  include cloudfour_potions::atom
  notice("Hi, future Lyza, from past Lyza")

  #package {'pandoc':
  #  ensure => installed
  #}

  package { 'evernote': provider => 'brewcask' }
  #
  # DOTFILES
  #  - install and use homeshick for managing dotfiles
  #  - install my dotfiles
  # Inspired by https://github.com/mroth/my-boxen/blob/master/modules/people/manifests/mroth.pp
  #
  file { 'homeshickdir':
    path => "${HOME}/.homesick/repos",
    ensure => directory
  }

  repository { 'homeshick':
    source => 'andsens/homeshick',
    path   => "${HOME}/.homesick/repos/homeshick",
    require => File['homeshickdir']
  }
  repository { 'lyzadanger-dotfiles':
    ensure  => 'origin/HEAD', # https://github.com/boxen/puppet-repository/issues/12
    source  => 'lyzadanger/dotfiles',
    path    => "${HOME}/.homesick/repos/dotfiles",
    require => File['homeshickdir'],
    notify  => Exec['link-dotfiles']
  }

  exec { 'link-dotfiles':
    command     => "bash -c 'source ${HOME}/.homesick/repos/homeshick/homeshick.sh; homeshick link dotfiles --force'",
    #refreshonly => true This is problematic because I tend to make changes in my local
  }
}
