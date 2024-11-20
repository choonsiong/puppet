$groups = [ 'sysadmins', 'dbas' ]

user { 'bob':
  ensure => present,
  groups => $groups
  #groups => [ 'sysadmins', 'dbas' ]
}
