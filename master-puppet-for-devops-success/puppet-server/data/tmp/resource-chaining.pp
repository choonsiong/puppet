package { 'httpd':
  ensure => installed,
} ->
file { '/etc/httpd/httpd.conf':
  ensure => file,
  source => 'puppet:///modules/apache/httpd.conf'
}
