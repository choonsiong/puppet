$user = with('susan', 'susan@example.com') |$u, $e| {
  {
    'user_name' => $u,
    'email' => $e
  }
}

$vhosts = ['acme.com', 'example.com', 'google.com']

$vhosts.each | $v | {
  file { ["/var/sites/${v}", "/var/log/vhosts/${v}"]:
    ensure => directory,
  }
}

$vhosts.each | String $v | {
  file { ["/var/sites/${v}", "/var/log/vhosts/${v}"]:
    ensure => directory,
  }
}

$users2 = ['kate', 'jane', 'fred', 'tom', 'harry']

$users2.each | String $u | {
  user { $u:
    ensure     => present,
    managehome => true,
  }

  file { "/home/${u}/.bashrc":
    ensure  => file,
    owner   => $u,
    group   => $u,
    content => 'export PATH=$PATH:/opt/puppetlabs/puppet/bin',
  }
}
