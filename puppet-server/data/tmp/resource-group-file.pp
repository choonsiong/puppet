file {
  '/etc/foo':
    ensure => file,
    source => 'puppet:///modules/mymodule/foo';
  '/etc/bar':
    ensure => file,
    source => 'puppet:///modules/mymodule/bar';
  '/etc/tango':
    ensure => file,
    source => 'puppet:///modules/mymodule/tango';
}
