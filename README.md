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

Start the puppet server container

```
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