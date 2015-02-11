class people::erikjung {
  include teams::dev

  package {
    'pandoc': ensure => installed
  }

  notice('Hullo, Erik, thanks for making coffee!')
}
