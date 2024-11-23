# Writing defined resource type
define apache::vhost (
  String $docroot = "/var/www/${name}",
  Integer $port,
) {
  file { $docroot:
    ensure => directory,
  }

  file { "/etc/httpd/conf.d/${name}.conf":
    ensure  => file,
    content => epp('apache/vhost.epp', { 'port' => $port }),
  }

  file { "${docroot}/index.html":
    ensure => file,
  }
}
