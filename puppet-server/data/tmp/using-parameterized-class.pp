class { 'apache':
  version     => '2.2.3',
  docroot     => '/sites/default',
  bindaddress => '10.0.1.15',
  port        => 80,
}
