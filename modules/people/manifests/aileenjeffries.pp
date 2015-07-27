class people::aileenjeffries {
  $HOME = "Users/${::boxen_user}"
  
  include cloudfour_potions::dotfiles
  
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
    source  => 'aileenjeffries/dotfiles', # Change me
    path    => "${HOME}/.homesick/repos/dotfiles",
    require => File['homeshickdir'],
    notify  => Exec['link-dotfiles']
  }

  exec { 'link-dotfiles':
    command     => "bash -c 'source ${HOME}/.homesick/repos/homeshick/homeshick.sh; homeshick link dotfiles --force'",
    #refreshonly => true
  }

  notice('Hi, there, Aileen! My best to the fam!')
}
