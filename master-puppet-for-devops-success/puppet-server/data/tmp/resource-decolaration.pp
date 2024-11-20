package { 'httpd': # resource decolartion
    ensure => installed,
}

service { 'httpd':
    ensure => running,
    require => Package['httpd'], # resource reference
}