# Use =~ to validate a value against a data type, outcome will be true of false
$hostname =~ String[4]
$port =~ Integer

$username = 'micky'

unless $username =~ String {
	fail('Invalid username')
}

notify { "Hello ${username}": }

unless $username =~ Stringp[4,8] { # between 4 and 8 characters long
	fail('Invalid username')
}

notify { "Hello ${username}": }

# Using data types in the evaluation of case and selector conditional statements
$bar = $foo ? {
	String => 'I am a string',
	Integer => 'I am a number',
	default => 'I am something else',
}