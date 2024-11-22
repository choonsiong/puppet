# To try the puppet server code in this repository

Copy everything under `puppet-server/data/` to `/etc/puppetlabs/code/` in the puppet server node. Alternatively, you can clone the repository and mount the directory on the running container directly ;p

```
root@puppet:~# cd /etc/puppetlabs/
root@puppet:/etc/puppetlabs# 
root@puppet:/etc/puppetlabs# tree code
code
|-- environments
|   `-- production
|       |-- manifests
|       |   `-- site.pp
|       `-- modules
|           |-- apache
|           |   |-- files
|           |   |   `-- httpd_minimal.conf
|           |   `-- manifests
|           |       |-- init.pp
|           |       |-- init2.pp
|           |       `-- init3.pp
|           |-- hostname
|           |   |-- functions
|           |   |   `-- environment.pp
|           |   `-- manifests
|           |       `-- init.pp
|           |-- motd
|           |   |-- files
|           |   |   `-- motd.txt
|           |   |-- manifests
|           |   |   `-- init.pp
|           |   `-- templates
|           |       `-- motd.epp
|           `-- sysadmins
|               `-- manifests
|                   `-- init.pp
|-- manifest
|   |-- bob.pp
|   `-- sysadmins.pp
`-- tmp
    |-- array.pp
    |-- array2.pp
    |-- array3.pp
    |-- case-statement.pp
    |-- codeblocks.pp
    |-- data_types.pp
    |-- facts.pp
    |-- facts2.pp
    |-- file.pp
    |-- file2.pp
    |-- functions.pp
    |-- hashes.pp
    |-- if-else-blocks.pp
    |-- mysql.pp
    |-- namevar.pp
    |-- puppet-function.pp
    |-- puppet-template.epp
    |-- puppet-template2.epp
    |-- puppet-template3.pp
    |-- relationships.pp
    |-- relationships2.pp
    |-- relationships3.pp
    |-- relationships4.pp
    |-- resource-chaining.pp
    |-- resource-chaining2.pp
    |-- resource-declaration.pp
    |-- resource-declaration2-before.pp
    |-- resource-declaration2.pp
    |-- scope.pp
    |-- scope2.pp
    |-- selectors.pp
    |-- string-interpolation.pp
    |-- test.pp
    |-- triggering-event.pp
    |-- triggering-event2.pp
    |-- triggering-event3.pp
    |-- variable.pp
    `-- variable2.pp

18 directories, 51 files
root@puppet:/etc/puppetlabs#
```

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

root@puppet-server-demo:/# 
root@puppet-server-demo:/# ping puppet-agent-demo
PING puppet-agent-demo (172.23.0.3) 56(84) bytes of data.
64 bytes from puppet-agent-demo.puppet-demo-net (172.23.0.3): icmp_seq=1 ttl=64 time=0.062 ms
64 bytes from puppet-agent-demo.puppet-demo-net (172.23.0.3): icmp_seq=2 ttl=64 time=0.271 ms
64 bytes from puppet-agent-demo.puppet-demo-net (172.23.0.3): icmp_seq=3 ttl=64 time=0.115 ms
64 bytes from puppet-agent-demo.puppet-demo-net (172.23.0.3): icmp_seq=4 ttl=64 time=0.384 ms
^C
--- puppet-agent-demo ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3013ms
rtt min/avg/max/mdev = 0.062/0.208/0.384/0.127 ms
root@puppet-server-demo:/#
```

Update puppet server `/etc/hosts` file on both server and agent:

```
root@puppet-server-demo:/# cat /etc/hosts
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.23.0.2	puppet-server-demo puppet
root@puppet-server-demo:/#
root@puppet-server-demo:/# puppetserver ca list --all
Signed Certificates:
    puppet-server-demo       (SHA256)  A0:17:8E:28:B7:FA:42:04:F3:C9:6B:BE:24:F6:F5:B7:03:31:47:BA:F5:8D:1C:D5:E0:48:0E:20:69:5E:3E:10	alt names: ["DNS:puppet", "DNS:puppet-server-demo"]	authorization extensions: [pp_cli_auth: true]
root@puppet-server-demo:/# 


root@puppet-agent-demo:/# cat /etc/hosts
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.23.0.3	puppet-agent-demo
172.23.0.2	puppet
root@puppet-agent-demo:/# 
root@puppet-agent-demo:/# 
```

Running `puppet agent -t` for the first time on agent node (you will get error, and remove the ssl folder in the agent node):

```
root@puppet-agent-demo:/# puppet agent -t
Info: Using environment 'production'
Error: certificate verify failed [unable to get local issuer certificate for CN=puppet-server-demo]
Error: Could not retrieve catalog from remote server: certificate verify failed [unable to get local issuer certificate for CN=puppet-server-demo]
Warning: Not using cache on failed catalog
Error: Could not retrieve catalog; skipping run
Error: Could not send report: certificate verify failed [unable to get local issuer certificate for CN=puppet-server-demo]
root@puppet-agent-demo:/# 
root@puppet-agent-demo:/# 
root@puppet-agent-demo:/# cd /etc/puppetlabs/puppet     
root@puppet-agent-demo:/etc/puppetlabs/puppet# ls
csr_attributes.yaml  devices  hiera.yaml  puppet.conf  puppetdb.conf  ssl
root@puppet-agent-demo:/etc/puppetlabs/puppet# 
root@puppet-agent-demo:/etc/puppetlabs/puppet# rm -rf ssl
root@puppet-agent-demo:/etc/puppetlabs/puppet# 
root@puppet-agent-demo:/etc/puppetlabs/puppet# 
root@puppet-agent-demo:/etc/puppetlabs/puppet# ls
csr_attributes.yaml  devices  hiera.yaml  puppet.conf  puppetdb.conf
root@puppet-agent-demo:/etc/puppetlabs/puppet# 
root@puppet-agent-demo:/etc/puppetlabs/puppet# 
root@puppet-agent-demo:/etc/puppetlabs/puppet# puppet agent -t
Info: Refreshed CRL: 7E:57:AA:0D:63:E8:FC:EC:D3:CF:6B:2D:DB:2D:4D:3E:B9:22:47:77:0D:23:7F:58:32:09:3D:DF:F3:5A:16:12
Info: Creating a new RSA SSL key for puppet-agent-demo
Info: csr_attributes file loading from /etc/puppetlabs/puppet/csr_attributes.yaml
Info: Creating a new SSL certificate request for puppet-agent-demo
Info: Certificate Request fingerprint (SHA256): 93:FE:0E:A4:7C:5E:31:BA:78:62:68:AE:71:7B:8E:34:87:F0:88:69:E4:05:78:12:F1:AC:AF:B7:6C:C1:F1:CF
Info: Downloaded certificate for puppet-agent-demo from https://puppet:8140/puppet-ca/v1
Info: Using environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Notice: Requesting catalog from puppet:8140 (172.23.0.2)
Notice: Catalog compiled by puppet-server-demo
Info: Caching catalog for puppet-agent-demo
Info: Applying configuration version '1732263119'
Info: Creating state file /opt/puppetlabs/puppet/cache/state/state.yaml
Notice: Applied catalog in 0.00 seconds
root@puppet-agent-demo:/etc/puppetlabs/puppet# 

root@puppet-server-demo:/# puppetserver ca list --all
Signed Certificates:
    puppet-agent-demo        (SHA256)  CE:D2:85:55:D6:44:E9:B6:82:A5:11:D3:5C:C2:AA:C3:6B:80:0F:0C:05:05:C7:A8:53:57:D5:CB:51:F4:59:05	alt names: ["DNS:puppet-agent-demo"]
    puppet-server-demo       (SHA256)  A0:17:8E:28:B7:FA:42:04:F3:C9:6B:BE:24:F6:F5:B7:03:31:47:BA:F5:8D:1C:D5:E0:48:0E:20:69:5E:3E:10	alt names: ["DNS:puppet", "DNS:puppet-server-demo"]	authorization extensions: [pp_cli_auth: true]
root@puppet-server-demo:/#
```

Now puppet server and puppet agent nodes are available to use, but kindly note that everytime you stop the agent node container, you will need to clean up the SSL folder again in order for the agent to work properly (in below case, we also need to fix the `/etc/hosts` file):

```
root@puppet-agent-demo:/etc/puppetlabs/puppet# 
root@puppet-agent-demo:/etc/puppetlabs/puppet# puppet agent -t
Info: Using environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Notice: Requesting catalog from puppet:8140 (172.23.0.2)
Notice: Catalog compiled by puppet-server-demo
Info: Caching catalog for puppet-agent-demo
Info: Applying configuration version '1732263119'
Notice: Applied catalog in 0.01 seconds
root@puppet-agent-demo:/etc/puppetlabs/puppet# 
root@puppet-agent-demo:/etc/puppetlabs/puppet# 
root@puppet-agent-demo:/etc/puppetlabs/puppet# exit
exit

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug puppet-agent-demo
    Learn more at https://docs.docker.com/go/debug-cli/
$ docker stop puppet-agent-demo
puppet-agent-demo
$

$ docker start puppet-agent-demo
puppet-agent-demo
$ docker exec -it puppet-agent-demo bash
root@puppet-agent-demo:/# 
root@puppet-agent-demo:/# puppet agent -t
Error: The CRL issued by 'CN=Puppet CA generated on puppet-server-demo at 2024-11-22 07:58:03 \+0000' is missing
Error: The CRL issued by 'CN=Puppet CA generated on puppet-server-demo at 2024-11-22 07:58:03 \+0000' is missing
root@puppet-agent-demo:/# 
root@puppet-agent-demo:/# 
root@puppet-agent-demo:/# cd /etc/puppetlabs/puppet/ssl/
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# 
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# ls
certificate_requests  certs  crl.pem  private  private_keys  public_keys
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# ls -l
total 24
drwxr-xr-x 2 puppet puppet 4096 Nov 22 08:11 certificate_requests
drwxr-xr-x 2 puppet puppet 4096 Nov 22 08:11 certs
-rw-r--r-- 1 puppet puppet 1994 Nov 22 08:15 crl.pem
drwxr-x--- 2 puppet puppet 4096 Nov 22 08:11 private
drwxr-x--- 2 puppet puppet 4096 Nov 22 08:11 private_keys
drwxr-xr-x 2 puppet puppet 4096 Nov 22 08:11 public_keys
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# 
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# rm -rf certificate_requests/ certs/ crl.pem private
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# 
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# 
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# ls
private_keys  public_keys
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# 
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# 
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# 
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# puppet agent -t
Error: Connection to https://puppet:8140/puppet-ca/v1 failed, trying next route: Request to https://puppet:8140/puppet-ca/v1 failed after 0.005 seconds: Failed to open TCP connection to puppet:8140 (getaddrinfo: Name or service not known)
Wrapped exception:
Failed to open TCP connection to puppet:8140 (getaddrinfo: Name or service not known)
Error: No more routes to ca
Error: No more routes to ca
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# cat /etc/hosts
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.23.0.3	puppet-agent-demo
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# vi /etc/hosts
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# puppet agent -t       
Info: Refreshed CRL: 7E:57:AA:0D:63:E8:FC:EC:D3:CF:6B:2D:DB:2D:4D:3E:B9:22:47:77:0D:23:7F:58:32:09:3D:DF:F3:5A:16:12
Info: csr_attributes file loading from /etc/puppetlabs/puppet/csr_attributes.yaml
Info: Creating a new SSL certificate request for puppet-agent-demo
Info: Certificate Request fingerprint (SHA256): 93:FE:0E:A4:7C:5E:31:BA:78:62:68:AE:71:7B:8E:34:87:F0:88:69:E4:05:78:12:F1:AC:AF:B7:6C:C1:F1:CF
Info: Downloaded certificate for puppet-agent-demo from https://puppet:8140/puppet-ca/v1
Info: Using environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Notice: Requesting catalog from puppet:8140 (172.23.0.2)
Notice: Catalog compiled by puppet-server-demo
Info: Caching catalog for puppet-agent-demo
Info: Applying configuration version '1732263119'
Notice: Applied catalog in 0.00 seconds
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# 
root@puppet-agent-demo:/etc/puppetlabs/puppet/ssl# 
```

The reason we need to fix the `/etc/hosts` file above is because we are using the name 'puppet-server-demo' instead of 'puppet' for the puppet server node, so if you start the puppet server container with below command (the command below make use of the environment variable `DOCKER_PUPPET_SERVER_DATA` which you can define your own in your shell startup file), then you can skip the `/etc/hosts` part.

`docker run -d --name puppet-server --network-alias puppet  --hostname puppet --network my_puppet_net -v "$DOCKER_PUPPET_SERVER_DATA:/etc/puppetlabs/code" ghcr.io/voxpupuli/puppetserver:8.6.1-latest`