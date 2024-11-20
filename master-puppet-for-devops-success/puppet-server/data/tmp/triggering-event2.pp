file { '/etc/httpd/httpd.conf':
    ensure => file,
    source => 'puppet:///modules/apache/httpd.conf',
    notify => Service['httpd'],
}

service { 'httpd':
    ensure => running,
}