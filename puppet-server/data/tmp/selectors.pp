# Selectors assign data based on an evaluation
# They do not control the flow of code

# Case-insensitive
$package_name = $::facts['os']['family'] ? {
  'Debian' => 'apache2',
  'Redhat' => 'httpd',
  'Solaris' => 'CSWApache2',
  default => 'httpd',
}

# Using regexp

$country = $domain ? {
  /.*\.uk$/ => 'United Kingdom',
  /.*\.es$/ => 'Spain',
  default => 'Other place',
}
