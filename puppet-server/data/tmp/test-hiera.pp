$message = lookup('greeting', String)

notify { "Greeting is '${message}'": }