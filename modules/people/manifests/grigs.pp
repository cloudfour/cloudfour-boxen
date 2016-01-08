class people::grigs {
  include cloudfour_potions::dotfiles
  #include mamppro
  # Hey Jason; I commented out mamppro because I know the binary
  # it's pointing at is no longer valid. You already have MAMP installed on
  # your current machine so this will not cause any changes for you at this time
  # (boxen will leave your current install alone)
  # If you need MAMP on a new machine later, may I suggest commenting out
  # the following line:
  # package {'mamp': provider => 'brewcask' }
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
    gem          => 'RedCloth',
    version      => '~> 4.2.9',
    ruby_version => '*',
  }

  # bundler for consoles.maban
  ruby_gem { 'bundler':
    gem          => 'bundler',
    version      => '~> 1.10.6',
    ruby_version => '*',
  }

  # classifier for consoles.maban
  ruby_gem { 'classifier':
    gem          => 'classifier',
    version      => '~> 1.3.3',
    ruby_version => '*',
  }


  package { 'pandoc':
    ensure => installed
  }
}
