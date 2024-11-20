$uids = {
  'bob' => '9999',
  'susan' => '9998',
  'peter' => '9997',
}

$uid_susan = $uids['susan']

notify { "Susan has the uid ${uid_susan}": }
