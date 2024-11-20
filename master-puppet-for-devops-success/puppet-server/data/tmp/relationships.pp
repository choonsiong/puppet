notify { 'a': }

notify { 'b':
    require => Notify['a'],
 }

notify { 'c':
    require => Notify['b'],
 }