$attrs = {
  'owner' => 'root',
  'group' => 'root',
  'mode' => '0644',
}

file { '/tmp/foo':
  ensure => file,
  *      => $attrs,
}
