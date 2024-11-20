class apache {
  $package_name = 'httpd'
  $service_name = 'httpd'
  $config_file = '/etc/httpd/conf/httpd.conf'

  package { $package_name:
    ensure => installed,
  }

  file { $config_file:
    ensure => file,
    source => 'puppet:///modules/apache/httpd_minimal.conf',
    require => Package[$package_name],
  }

  service { $service_name:
    ensure => running,
    enable => true,
    subscribe => File[$config_file],
  }

  file { '/var/www/html':
    ensure => directory,
  }
}
