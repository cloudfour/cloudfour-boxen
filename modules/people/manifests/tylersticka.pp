class people::tylersticka {
  # npm
  nodejs::module { 'svgo for 0.10': module => 'svgo', node_version => 'v0.10' }

  # modules
  include imageoptim
  include imagealpha

  # hello
  notice('Hi, Tyler! Happy designing 😄')
}
