# DNS generator for Rancher

This container gets containers info from __rancher-metada__ by using __rancher-gen__ and generates a __dnsmasq__ configuration addressing containers.

There is a small diference from native DNS service. Instead do a round-robin when there are multiples containers for a single name, this service deliver an IP for a container in the same host.


## Motivation

I got annoyed when running services on 3 different hosts. The Wordpress container sometimes tries to reach Percona node running on different server, instead using the Percona node on same server.

This should not be a problem if servers are close to each other, but I had to deal with 2 servers on Canada and another one on Germany. Also, the main audience comes from Brazil.

So, to make Wordpress access Percona node close to it, I wrote this small services, copying some pieces from Rancher-Active-Proxy.


## How to use

The __rancher-dns-gen__ should run in all environment's hosts and to achieve this easily, a label `io.rancher.scheduler.global: 'true'` must be created. Also, this container should run in bridge mode and a fallback DNS resolver should be provided, propably falling back to `169.254.169.250`.

After that, containers you want resolve by using __rancher-dns-gen__ must be configured to use IP address of __rancher-dns-gen__ container.

The `docker-compose.yml` below creates __rancher-dns-gen__ container in all hosts of an environment.

```yml
version: '2'
services:
  rancher-dns-gen:
    privileged: true
    image: montefuscolo/rancher-dns-gen
    network_mode: bridge
    dns:
    - 169.254.169.250
    tty: true
    labels:
      io.rancher.container.pull_image: always
      io.rancher.scheduler.global: 'true'
```

That is all!
