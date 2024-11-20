package { 'mysql':
  ensure => installed,
  provider => 'gem', # mysql ruby gem
}

package { 'rpm mysql':
  ensure => installed,
  name => 'mysql',
}