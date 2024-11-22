class motd {
  $params = {
    'os_name' => $::facts['os']['name'],
    'os_major' => $::facts['os']['release']['major'],
    #'os_minor' => $::facts['os']['release']['minor'],
    'os_arch' => $::facts['os']['hardware'],
    'server_name' => $::trusted['certname'],
  }

  file { '/etc/motd':
    ensure  => file,
    #source => 'puppet:///modules/motd/motd.txt',
    content => epp('motd/motd.epp', $params),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    #replace => false,
  }

  file { '/root/settings':
    ensure => directory,
  }

  file { '/root/settings/motd':
    ensure => symlink,
    target => '/etc/motd',
  }
}
