# [Puppet](https://www.puppet.com/)

- [Puppet Blog](https://www.puppet.com/blog)
- [Puppet Docker Container](https://hub.docker.com/r/voxpupuli/container-puppetserver)

# Running Puppet container

Create a puppet network:

```
$ docker network create puppet-demo-net
66b99fcf08fbe4be934394dbb3f3c28963acc4bb53ce793ba7df789a3a9da851
$
$
$ docker network ls
NETWORK ID     NAME                        DRIVER    SCOPE
f378b1260212   book-app-frontend_default   bridge    local
fe5f2e14a10c   bridge                      bridge    local
2c24dd4c6e80   cassandra-net               bridge    local
c5f8e17ee95e   host                        host      local
be56ceec6851   my_puppet_net               bridge    local
ff0723b8a8e8   none                        null      local
b3de88bf6363   openldap-net                bridge    local
66b99fcf08fb   puppet-demo-net             bridge    local
09d0c94f5368   test-net                    bridge    local
$
```

Start the puppet server container:

```
$ mkdir /tmp/puppet-server-demo
$
$ docker run -d --name puppet-server-demo --network-alias puppet-server-demo  --hostname puppet-server-demo --network puppet-demo-net -v "/tmp/puppet-server-code:/etc/puppetlabs/code" ghcr.io/voxpupuli/puppetserver:8.6.1-latest
d1ee65737082f87e4d461f5fe4af6cf10e2a369fb36fc3a3304177a1d58470ae
$
$ docker exec -it puppet-server-demo bash
root@puppet-server-demo:/# 
root@puppet-server-demo:/# puppet --version
8.8.1
root@puppet-server-demo:/# 
root@puppet-server-demo:/# 
root@puppet-server-demo:/# 
root@puppet-server-demo:/# exit
exit

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug puppet-server-demo
    Learn more at https://docs.docker.com/go/debug-cli/
```

Start the puppet agent container:

```
$ 
$ mkdir /tmp/puppet-agent-code 
$
$ docker run -d --name puppet-agent-demo --network-alias puppet-agent-demo  --hostname puppet-agent-demo --network puppet-demo-net -v "/tmp/puppet-agent-code:/etc/puppetlabs/code" ghcr.io/voxpupuli/puppetserver:8.6.1-latest 
52dccb8c8dc0f56dc411cc9d963b5f64e7394af8fa3da814a5886db69fd29704
$
$
$ docker exec -it puppet-agent-demo bash
root@puppet-agent-demo:/# 
root@puppet-agent-demo:/# 
root@puppet-agent-demo:/# 
root@puppet-agent-demo:/# ping puppet-server-demo
PING puppet-server-demo (172.23.0.2) 56(84) bytes of data.
64 bytes from puppet-server-demo.puppet-demo-net (172.23.0.2): icmp_seq=1 ttl=64 time=0.107 ms
64 bytes from puppet-server-demo.puppet-demo-net (172.23.0.2): icmp_seq=2 ttl=64 time=0.153 ms
64 bytes from puppet-server-demo.puppet-demo-net (172.23.0.2): icmp_seq=3 ttl=64 time=0.272 ms
64 bytes from puppet-server-demo.puppet-demo-net (172.23.0.2): icmp_seq=4 ttl=64 time=0.292 ms
^C
--- puppet-server-demo ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3044ms
rtt min/avg/max/mdev = 0.107/0.206/0.292/0.078 ms
root@puppet-agent-demo:/#
```