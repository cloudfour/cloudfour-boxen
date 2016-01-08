# See also: https://github.com/cloudfour/cloudfour-boxen/wiki/Personal-Module-Recipes
class people::mrgerardorodriguez {
  $HOME = "/Users/${::boxen_user}"

  # modules
  include cloudfour_potions::dotfiles
  include cloudfour_potions::sublime_text2

  include iterm2::dev
  include teams::dev
  include licecap

  package { 'atom': provider => 'brewcask' }
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
    source  => 'mrgerardorodriguez/dotfiles', # Change me
    path    => "${HOME}/.homesick/repos/dotfiles",
    require => File['homeshickdir'],
    notify  => Exec['link-dotfiles']
  }

  exec { 'link-dotfiles':
    command     => "bash -c 'source ${HOME}/.homesick/repos/homeshick/homeshick.sh; homeshick link dotfiles --force'",
    #refreshonly => true
  }

  notice("Hullo, Mr. Gerardo!")
}
