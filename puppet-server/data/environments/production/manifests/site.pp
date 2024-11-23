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
}
