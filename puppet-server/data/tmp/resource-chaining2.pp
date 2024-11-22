# Resource chaining

-> left before right

<- right before left

~> left refreshes right

<~ right refreshes left

Package['httpd'] -> File['/etc/httpd/httpd.conf'] ~> Service['httpd']
Service['httpd'] <~ File['/etc/httpd/httpd.conf'] <- Package['httpd']
