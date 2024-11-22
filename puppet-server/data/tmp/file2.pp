file { '/etc/httpd/httpd.conf':
  ensure => file,
  source => 'puppet:///modules/apache/httpd.conf',
  owner => 'root',
  group => 'root',
  mode => '0644',
}