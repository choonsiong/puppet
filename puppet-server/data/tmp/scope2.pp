$var = 1 # top scope

class foo {
  $var = 2 # class scope
}

class bar {
  $var = 3 # class scope
  
  $::foo::var # reference foo class's var
}
