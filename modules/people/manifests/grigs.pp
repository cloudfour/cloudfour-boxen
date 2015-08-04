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
  
  # jekyll
  ruby_gem { 'jekyll':
    gem          => 'jekyll',
    version      => '~> 2.5.3',
    ruby_version => '*',
  }

  # RedCloth for jekyll
  ruby_gem { 'RedCloth':
    gem          => 'redcloth',
    version      => '~> 4.2',
    ruby_version => '*',
  }


  package { 'pandoc':
    ensure => installed
  }
}
