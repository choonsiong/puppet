# Below is a regular hash!
$attrs = {
  'owner' => 'root',
  'group' => 'root',
  'mode' => '0644',
}

file {
  default: # resource defaults apply only to this resource group only, so won't affect 'include classes'
    ensure => file,
    *      => $attrs; # Only available after puppet 4

  '/tmp/foo':
    source => 'puppet:///modules/mymodule/foo';
  '/tmp/bar':
    source => 'puppet:///modules/mymodule/bar';
  '/tmp/tango':
    source => 'puppet:///modules/mymodule/tango',
    group  => 'wheel';
}
