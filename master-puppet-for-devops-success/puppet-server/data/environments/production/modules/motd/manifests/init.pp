class motd {
  file { '/etc/motd':
    ensure => file,
    source => 'puppet:///modules/motd/motd.txt',
    owner => 'root',
    group => 'root',
    mode => '0644',
    replace => false,
  }
  
  file { '/root/settings':
    ensure => directory,
  }
  
  file { '/root/settings/motd':
    ensure => symlink,
    target => '/etc/motd',
  }
}