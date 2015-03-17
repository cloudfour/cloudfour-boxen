class people::grigs {
  include cloudfour_potions::dotfiles
  include mamppro
  notice('Jason loves sheep')

  # Twurl
  ruby_gem { 'Twurl':
    gem          => 'twurl',
    version      => '~> 0.9',
    ruby_version => '*',
  }

  package { 'pandoc':
    ensure => installed
  }
}
