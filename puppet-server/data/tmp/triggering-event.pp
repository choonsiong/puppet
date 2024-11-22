file { '/etc/httpd/httpd.conf':
    ensure => file,
    source => 'puppet:///modules/apache/httpd.conf',
}

service { 'httpd':
    ensure => running,
    subscribe => File['/etc/httpd/httpd.conf'], # subscribe to file change event
}