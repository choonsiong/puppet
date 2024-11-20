notify { 'a': }

notify { 'b': }

notify { 'c': }

Notify['a'] -> Notify['b'] -> Notify['c']
