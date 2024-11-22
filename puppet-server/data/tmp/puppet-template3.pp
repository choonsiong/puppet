$params = { 'role' => 'database', 'server_name' => 'oracle01' }
#$output = epp('mymodule/welcome.epp', $params)

file { '/etc/motd':
  ensure  => file,
  #content => $output,
  content => epp('mymodule/welcome.epp', $params),
}
