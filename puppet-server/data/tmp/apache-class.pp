class apache {
  $version = '2.2.3'
  $docroot = '/export/sites/default'
  $bindaddress = '10.0.1.15'
  $port = 80

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
