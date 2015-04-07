class people::erikjung {
  $HOME = "/Users/${::boxen_user}"

  include teams::dev
  include phantomjs::1_9_0
  include cloudfour_potions::atom
  include cloudfour_potions::dotfiles
  include imageoptim
  include licecap

  # Package stuff

  package { 'pandoc':
    ensure => installed
  }

  package { 'tree':
    ensure => installed
  }

  phantomjs::global { '1.9.0': }

  nodejs::module { 'divshot for evaluation for 0.10':
    module       => 'divshot-cli',
    node_version => 'v0.10'
  }

  # Dotfiles

  file { 'homeshickdir':
    path   => "${HOME}/.homesick/repos",
    ensure => directory
  }

  repository { 'homeshick':
    source  => 'andsens/homeshick',
    path    => "${HOME}/.homesick/repos/homeshick",
    require => File['homeshickdir']
  }

  repository { 'my-dotfiles':
    ensure  => 'origin/HEAD',
    source  => 'erikjung/dotfiles',
    path    => "${HOME}/.homesick/repos/dotfiles",
    require => File['homeshickdir'],
    notify  => Exec['link-dotfiles']
  }

  exec { 'link-dotfiles':
    command      => "bash -c 'source ${HOME}/.homesick/repos/homeshick/homeshick.sh; homeshick link dotfiles --force'",
    #refreshonly => true
  }

  notice('Hullo, Erik, thanks for making coffee!')
}
