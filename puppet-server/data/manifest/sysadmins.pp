# Below only define a class, to allow puppet apply to work properly,
# we need to also declare a class (check out puppet modulepath).
class sysadmins {
	group { 'sysadmins':
		ensure => present,
	}

	user { 'alice':
		ensure => present,
		uid => '9998',
		groups => 'sysadmins',
	}
}