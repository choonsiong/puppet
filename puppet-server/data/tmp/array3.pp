file { '/etc/app.conf'
  ensure => file,
  require => Package[ 'httpd', 'acmeapp' ],
}

file { '/etc/web.conf': 
  ensure => file,
  require => [ Package['httpd'], Service['acmed'] ],
}
