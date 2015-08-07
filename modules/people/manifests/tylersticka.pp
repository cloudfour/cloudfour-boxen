class people::tylersticka {
  $HOME = "/Users/${::boxen_user}"

  # npm
  nodejs::module { 'svgo for 0.10': module => 'svgo', node_version => 'v0.10' }

  # modules
  include imageoptim
  include imagealpha
  include licecap

  include cloudfour_potions::atom
  include cloudfour_potions::dotfiles

  package {'pandoc':
    ensure => installed
  }

  package {'bash-completion':
    ensure => installed
  }

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
    source  => 'tylersticka/dotfiles', # Change me
    path    => "${HOME}/.homesick/repos/dotfiles",
    require => File['homeshickdir'],
    notify  => Exec['link-dotfiles']
  }

  exec { 'link-dotfiles':
    command     => "bash -c 'source ${HOME}/.homesick/repos/homeshick/homeshick.sh; homeshick link dotfiles --force'",
    #refreshonly => true
  }

  # hello
  notice('Hi, Tyler! Happy designing 😄')
}
