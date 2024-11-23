apache::vhost { 'acme.com':
  port => 80,
}

apache::vhost { 'example.com':
  port => 81,
}

apache::vhost { 'foo.com':
  port => 82,
}
