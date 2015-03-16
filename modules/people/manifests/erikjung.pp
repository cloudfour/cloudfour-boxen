class people::erikjung {
  include teams::dev
  include phantomjs::1_9_0
  include imageoptim
  include licecap

  package { 'pandoc':
    ensure => installed
  }

  package { 'tree':
    ensure => installed
  }

  # Set the global version of PhantomJS (version should be installed already)
  phantomjs::global { '1.9.0': }

  nodejs::module { 'divshot for evaluation for 0.10': module => 'divshot-cli', node_version => 'v0.10' }

  notice('Hullo, Erik, thanks for making coffee!')
}
