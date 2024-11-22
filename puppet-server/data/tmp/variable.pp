$pkgname = 'apache' # once declared, a variabel cannot be modified or re-declared

package { $pkgname:
  ensure => installed,
}

$userid = '9999'

user { 'bob':
  ensure => present,
  uid => $userid,
}
