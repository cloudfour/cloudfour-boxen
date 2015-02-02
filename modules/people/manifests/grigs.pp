class people::grigs {
  include mamppro
  notice('Jason loves sheep')

  # Twurl
  ruby_gem { 'Twurl':
    gem          => 'twurl',
    version      => '~> 0.9',
    ruby_version => '*',
  }
}
