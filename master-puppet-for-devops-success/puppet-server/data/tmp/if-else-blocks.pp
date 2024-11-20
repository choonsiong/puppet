# If / else /elsif blocks are used to control the general flow of code
# The block is executed if the evaluation is true

if $install_package {
  package { $packagename:
    ensure => installed,
  }
}

if $environment == 'dev' {
  include devutils
}

unless $environment == 'dev' {
  include users::prod
}

if $environment != 'dev' {
  include users::prod
}
