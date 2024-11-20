package { 'httpd':
    ensure => installed,
    before => Service['httpd'],
}

service { 'httpd':
    ensure => running,
}