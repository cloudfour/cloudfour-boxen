class people::lyzadanger {
  include cloudfour_potions::dotfiles
  $HOME = "/Users/${::boxen_user}"
  include teams::dev

  notice("Hi, future Lyza, from past Lyza")

  # OS X defaults
  include osx::global::disable_autocorrect
  include osx::dock::autohide
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::show_all_filename_extensions
  include osx::safari::enable_developer_mode

  class { 'osx::dock::icon_size':
    size => 42
  }

  class { 'osx::dock::magnification':
    magnification => true,
    magnification_size => 60
  }

  # Trust me, use brewcask instead. Unless you have 3 hours to shed.
  #package {'pandoc':
  #  ensure => installed
  #}
  package { 'atom': provider => 'brewcask' }
  package { 'evernote': provider => 'brewcask' }
  package { 'fluid': provider => 'brewcask' }
  package { 'iterm2': provider => 'brewcask' }
  package { 'pandoc': provider => 'brewcask' }
  package { 'mactex': provider => 'brewcask' }

  # `~Projects` directory for my gitness
  file { 'projectsdir':
    path => "${HOME}/Projects",
    ensure => directory
  }

  #
  # DOTFILES
  #  - install and use homeshick for managing dotfiles
  #  - install my dotfiles
  # Inspired by https://github.com/mroth/my-boxen/blob/master/modules/people/manifests/mroth.pp
  #
  file { 'homeshickparentdir':
    path => "${HOME}/.homesick",
    ensure => directory
  }

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

  # Inconsolata (fixed-width) font
  file { "Inconsolata Font":
    ensure => 'present',
    path   => "${HOME}/Library/Fonts/Inconsolata.otf",
    source => 'puppet:///modules/people/Inconsolata.otf'
  }
}
