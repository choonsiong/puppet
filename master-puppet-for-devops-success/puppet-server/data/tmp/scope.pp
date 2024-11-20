$top_scope = 1

class foo {
  $top_scope = 2 # will override above top scope variable
  
  # if we want to reference the top_scope variable
  $::top_scope 
}
