exec { 'install demo application':
  path => '/root/bin:/usr/local/bin:/usr/bin:/bin',
  command => 'install.sh',
  unless => 'test -d /opt/myapp',
#  creates => '/opt/myapp',
}