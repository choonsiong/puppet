file {
  default: # resource defaults apply only to this resource group only, so won't affect 'include classes'
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644';

  '/tmp/foo':
    source => 'puppet:///modules/mymodule/foo';
  '/tmp/bar':
    source => 'puppet:///modules/mymodule/bar';
  '/tmp/tango':
    source => 'puppet:///modules/mymodule/tango',
    group  => 'wheel';
}
