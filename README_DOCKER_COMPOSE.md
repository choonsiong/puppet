# Using docker compose

You can also use the `docker-compose.yml` available to start up the puppet server and agent containers. In the docker compose file, we mount the directories `puppet-server-data` and `puppet-agent-data` on the host to the `/etc/puppetlabs/code` inside the container. Then follow the steps in `README_DOCKER_CONTAINER` to fix the SSL issue.

To start the container using compose, run `docker compose up -d`

To stop the container, run `docker compose stop`

To stop and remove the container, run `docker compose down`

You will have to manually remove the directories if no longer needed.

```
$ ls
docker-compose.yml  puppet-agent-data/  puppet-server-data/
$
$
$ docker compose up -d
[+] Running 3/3
 ✔ Network puppet-server-agent-compose_default           Created                                                                                                                                                                              0.0s 
 ✔ Container puppet-server-agent-compose-puppetagent-1   Started                                                                                                                                                                              0.2s 
 ✔ Container puppet-server-agent-compose-puppetserver-1  Started                                                                                                                                                                              0.2s 
$
$ docker ps
CONTAINER ID   IMAGE                                         COMMAND                  CREATED         STATUS                            PORTS      NAMES
d1a51e0f7a97   ghcr.io/voxpupuli/puppetserver:8.6.1-latest   "dumb-init /docker-e…"   3 seconds ago   Up 2 seconds (health: starting)   8140/tcp   puppet-server-agent-compose-puppetserver-1
b33a75482950   ghcr.io/voxpupuli/puppetserver:8.6.1-latest   "dumb-init /docker-e…"   3 seconds ago   Up 2 seconds (health: starting)   8140/tcp   puppet-server-agent-compose-puppetagent-1
$
$
$ docker exec -it d1a5 bash
root@puppet:/# 
root@puppet:/# ping puppet-agent
PING puppet-agent (172.24.0.3) 56(84) bytes of data.
64 bytes from puppet-server-agent-compose-puppetagent-1.puppet-server-agent-compose_default (172.24.0.3): icmp_seq=1 ttl=64 time=0.049 ms
64 bytes from puppet-server-agent-compose-puppetagent-1.puppet-server-agent-compose_default (172.24.0.3): icmp_seq=2 ttl=64 time=0.325 ms
64 bytes from puppet-server-agent-compose-puppetagent-1.puppet-server-agent-compose_default (172.24.0.3): icmp_seq=3 ttl=64 time=0.333 ms
64 bytes from puppet-server-agent-compose-puppetagent-1.puppet-server-agent-compose_default (172.24.0.3): icmp_seq=4 ttl=64 time=0.340 ms
64 bytes from puppet-server-agent-compose-puppetagent-1.puppet-server-agent-compose_default (172.24.0.3): icmp_seq=5 ttl=64 time=0.321 ms
^C
--- puppet-agent ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4031ms
rtt min/avg/max/mdev = 0.049/0.273/0.340/0.112 ms
root@puppet:/# exit
exit

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug d1a5
    Learn more at https://docs.docker.com/go/debug-cli/

$
$ docker exec -it b33a bash
root@puppet-agent:/#  
root@puppet-agent:/# 
root@puppet-agent:/# ping puppet
PING puppet (172.24.0.2) 56(84) bytes of data.
64 bytes from puppet-server-agent-compose-puppetserver-1.puppet-server-agent-compose_default (172.24.0.2): icmp_seq=1 ttl=64 time=0.078 ms
64 bytes from puppet-server-agent-compose-puppetserver-1.puppet-server-agent-compose_default (172.24.0.2): icmp_seq=2 ttl=64 time=0.303 ms
64 bytes from puppet-server-agent-compose-puppetserver-1.puppet-server-agent-compose_default (172.24.0.2): icmp_seq=3 ttl=64 time=0.120 ms
^C
--- puppet ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2052ms
rtt min/avg/max/mdev = 0.078/0.167/0.303/0.097 ms
root@puppet-agent:/# exit
exit

What's next:
    Try Docker Debug for seamless, persistent debugging tools in any container or image → docker debug b33a
    Learn more at https://docs.docker.com/go/debug-cli/
$
```