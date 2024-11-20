file { '/opt/myapp/hello.txt':
  ensure => file,
  content => 'Hello',
  owner => 'root',
  group => 'root',
  mode => '0644',
}