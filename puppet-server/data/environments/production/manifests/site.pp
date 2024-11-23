node 'default' {
  include motd
}

node 'agent6' {
  include sysadmins
  include motd
}

node 'agentdemo' {
  #include apache
  class { 'apache': # We need to use this syntax to pass argument to the class
    port    => 8080,
    docroot => '/tmp',
  }

  # using defined resource
  apache::vhost { 'acme.com':
    port    => 8081,
    docroot => '/var/www/acme.com',
  }

  # we can instantiate defined source multipe times (but class cannot!)
  apache::vhost { 'example.com':
    port    => 8081,
    docroot => '/var/www/example.com',
  }
}
