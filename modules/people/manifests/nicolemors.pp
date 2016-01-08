class people::nicolemors {
  include cloudfour_potions::dotfiles

  # Make sure this is set somewhere before the dotfiles stuff
  $HOME = "/Users/${::boxen_user}"
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
  repository { 'my-dotfiles':
    ensure  => 'origin/HEAD', # https://github.com/boxen/puppet-repository/issues/12
    source  => 'nicolemors/dotfiles', # Change me
    path    => "${HOME}/.homesick/repos/dotfiles",
    require => File['homeshickdir'],
    notify  => Exec['link-dotfiles']
  }

  exec { 'link-dotfiles':
    command     => "bash -c 'source ${HOME}/.homesick/repos/homeshick/homeshick.sh; homeshick link dotfiles --force'",
    #refreshonly => true
  }

  # hello

  notice('Hi, Nicole! Here comes some software!')
}
