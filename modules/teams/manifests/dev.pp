class teams::dev {
  # Things the dev team needs that may be
  # extraneous for other folkx
  notice('Hi from Team dev!')
  include heroku

  # https://github.com/boxen/puppet-heroku
  # goes with heroku
  heroku::plugin { 'accounts':
    source => 'ddollar/heroku-accounts'
  }
}
