# Using resource defaults
File { # referencing all file resource in this file
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0644'
}

file {
  '/tmp/foo':
    source => 'puppet:///modules/mymodule/foo';
  '/tmp/bar':
    source => 'puppet:///modules/mymodule/bar';
  '/tmp/tango':
    source => 'puppet:///modules/mymodule/tango',
    group  => 'wheel';
}
