class apache (
  $version,
  $docroot,
  $bindaddress,
  $port
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
