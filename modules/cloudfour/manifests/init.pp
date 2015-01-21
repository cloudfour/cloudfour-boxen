class cloudfour {
  # npm
  nodejs::module { 'grunt for 0.8': module => 'grunt', node_version => 'v0.8' }
  nodejs::module { 'grunt for 0.10': module => 'grunt', node_version => 'v0.10' }
  nodejs::module { 'gulp for 0.10': module => 'gulp', node_version => 'v0.10' }

  include java
  include wget
  # include nvm

  include harvest
  include onepassword
  include sublime_text
  include iterm2::stable
  include dropbox
  include heroku
  include virtualbox

  # https://github.com/boxen/puppet-heroku
  heroku::plugin { 'accounts':
    source => 'ddollar/heroku-accounts'
  }

  include chrome
  include firefox
  include atom

  ruby_gem { 'SASS for all rubies':
    gem          => 'sass',
    version      => '~> 3.1',
    ruby_version => '*',
  }

  ruby_gem { 'Compass for all rubies':
    gem          => 'compass',
    version      => '~> 0.12',
    ruby_version => '*',
  }

  # Config should be set in hiera
  # See https://github.com/cloudfour/cloudfour-boxen/issues/10
  class { 'nodejs::global': version => 'v0.10' }
  # See https://github.com/cloudfour/cloudfour-boxen/issues/9
  class { 'ruby::global': version => '2.1.0' }

  file {
    '/Applications/boxen':
      ensure => 'link',
      target => '/opt/boxen/repo/script/boxen'
  }
}
