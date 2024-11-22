# facter os.family

$whoami = $::facts['os']['family']

notify { "I am running on ${whoami}": }
