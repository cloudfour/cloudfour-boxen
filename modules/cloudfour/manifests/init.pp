class cloudfour {
  # The goal of this module is to set everyone up to be
  # equally able to run our web projects locally

  # npm
  nodejs::module { 'grunt for 0.8': module => 'grunt', node_version => 'v0.8' }
  nodejs::module { 'grunt for 0.10': module => 'grunt', node_version => 'v0.10' }
  nodejs::module { 'grunt-cli for 0.10': module => 'grunt-cli', node_version => 'v0.10' }
  nodejs::module { 'gulp for 0.10': module => 'gulp', node_version => 'v0.10' }
  nodejs::module { 'divshot for 0.10': module => 'divshot-cli', node_version => 'v0.10' }
  nodejs::module { 'jshint for 0.10': module => 'jshint', node_version => 'v0.10' }
  #nodejs::module { 'yeoman for 0.10': module => 'yo', node_version => 'v0.10' }

  include java
  include wget

  include harvest
  include onepassword
  # everyone uses dropbox
  include dropbox

  # everyone uses onepassword
  # we may move away from managing with boxen
  # at some point
  include onepassword

  include harvest
  include skype

  # everyone uses browsers
  # this is just to get 'em installed
  # don't care if boxen manages these later
  include chrome
  include firefox


  # dev
  #include heroku
  include virtualbox

  # Everyone gets Sass
  ruby_gem { 'SASS for all rubies':
    gem          => 'sass',
    version      => '~> 3.1',
    ruby_version => '*',
  }

  # Everyone gets compass
  ruby_gem { 'Compass for all rubies':
    gem          => 'compass',
    version      => '~> 0.12',
    ruby_version => '*',
  }

  # Set system global version defaults
  # Config should be set in hiera
  # See https://github.com/cloudfour/cloudfour-boxen/issues/10
  class { 'nodejs::global': version => 'v0.10' }
  # See https://github.com/cloudfour/cloudfour-boxen/issues/9
  class { 'ruby::global': version => '2.1.0' }

  # Symlink to boxen script from Applications dir for
  # those who like to double-click on things
  file {
    '/Applications/boxen':
      ensure => 'link',
      target => '/opt/boxen/repo/script/boxen'
  }
}
