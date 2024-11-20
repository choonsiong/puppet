$users = [ 'bob', 'susan', 'peter' ]

user { $users: # this creates multiple users
  ensure => present,
}
