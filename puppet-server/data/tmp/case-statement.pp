# Case statements execute a block of code depending on the evaluation

case $::facts['os']['family'] {
  'Redhat': {
    include yum
  }
  'Debian': {
    include apt
  }
  default: {
    fail ('Unknown operating system')
  }
}

# Using regexp

case $::trusted['certname'] {
  /.*\.uk\..*/: {
    include users::london
  }
  /.*\.es\..*/: {
    include users::madrid
  }
  default: {
    fail ('Not in the UK')
  }
}
