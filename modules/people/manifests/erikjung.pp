class people::erikjung {
  $HOME = "/Users/${::boxen_user}"

  include teams::dev
  # include phantomjs::1_9_0
  package { 'atom': provider => 'brewcask' }
  package { 'licecap': provider => 'brewcask' }
  include cloudfour_potions::dotfiles
  include imageoptim

  # Package stuff

  package { 'pandoc':
    ensure => installed
  }

  package { 'tree':
    ensure => installed
  }

  # Note to Erik: if you want to install phantom later, you might consider
  # uncommenting the following:
  # package { 'phantom': provider => 'brewcask' }


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
