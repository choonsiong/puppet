node "default" {
  include motd
}

node "agent6" {
	include sysadmins
	include motd
	#include apache
}
