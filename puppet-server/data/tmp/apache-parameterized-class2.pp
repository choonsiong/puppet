class apache (
  $version,
  $docroot,
  $bindaddress,
  $port = 80, # Specifies default value
) {
  package { 'httpd':
    ensure => $version,
  }

  $params = {
    'docroot' => $docroot,
    'bindaddress' => $bindaddress,
  }

  file { '/etc/httpd/conf/httpd.conf':
    ensure  => file,
    content => epp('apache/httpd.conf.epp', $params),
  }
}