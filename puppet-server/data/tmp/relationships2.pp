notify { 'a': }

notify { 'b':
    require => Notify['a'],
    before => Notify['c'],
 }

notify { 'c': }