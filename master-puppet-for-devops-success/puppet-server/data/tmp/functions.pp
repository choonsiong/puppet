#function(arg, arg) # prefixed syntax
#arg.function(arg, arg) # chained syntax notation

notice('hello world')

"Hello World".notice

$hash = md5('hello world')
notice($hash)

$email = 'foobar@example.com'

$username1 = match($email, /^([a-z]+)\@.*$/)
$username2 = $email.match(/^([a-z]+)\@.*$/)

notice($username1)
notice($username2)
