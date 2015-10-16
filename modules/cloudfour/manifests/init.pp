class cloudfour {
  # The goal of this module is to set everyone up to be
  # equally able to run our web projects locally

  # npm
  npm_module { 'grunt-cli': module => 'grunt-cli', node_version => '0.10' }
  npm_module { 'gulp': module => 'gulp', node_version => '0.10' }
  npm_module { 'divshot': module => 'divshot-cli', node_version => '0.10' }
  npm_module { 'jshint': module => 'jshint', node_version => '0.10' }
  npm_module { 'jscs': module => 'jscs', node_version => '0.10' }
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
  class { 'nodejs::global': version => '0.10' }
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
