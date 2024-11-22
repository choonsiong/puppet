$username = 'bob'
$firstname = 'Bob'
$lastname = 'Smith'
$comment = "${firstname} ${lastname}"

user { $username:
  ensure => present,
  comment => $comment,
}
