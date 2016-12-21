[![](https://images.microbadger.com/badges/image/rawmind/rancher-traefik.svg)](https://microbadger.com/images/rawmind/rancher-traefik "Get your own image badge on microbadger.com")

rancher-traefik
==============

This image is the traefik dynamic conf for rancher. It comes from [rawmind/rancher-tools][rancher-tools].

## Build

```
docker build -t rawmind/rancher-traefik:<version> .
```

## Versions

- `0.3.4-14` [(Dockerfile)](https://github.com/rawmind0/rancher-traefik/blob/0.3.4-14/Dockerfile)
- `0.3.4` [(Dockerfile)](https://github.com/rawmind0/rancher-traefik/blob/0.3.4/Dockerfile)


## Usage

This image has to be run as a sidekick of [rawmind/alpine-traefik][alpine-traefik], and makes available /opt/tools volume. It scans from rancher-metadata, looking for services and externalServices that has traefik labels, and generates traefik frontend and backends to expose the services.


## Configuration labels

Traefik labels, has to be created in your service or externalService, in order to get included in traefik dynamic config. 

- traefik.enable = < true | stack | false > #Controls if you want to publish or not the service
  - true: the service will be published as *service_name.stack_name.traefik_domain*
  - stack: the service will be published as *stack_name.domain*. WARNING: You can have collisions inside services within your stack
  - false: the service will not be published
- traefik.alias = < alias >			# Alternate names to route rule. Multiple values separated by ",". WARNING: You could have collisions BE CAREFULL
- traefik.domain = < domain.name >	# Domain names to route rules. Multiple domains separated by ","
- traefik.path = < path >		    # Path to route rule. Multiple domains separated by ","
- traefik.port = <port>				# port to expose throught traefik
- traefik.acme = < true | false >	# Enable/disable ACME traefik feature

WARNING: Only services with healthy state are added to traefik, so health checks are mandatory.

[alpine-traefik]: https://github.com/rawmind0/alpine-traefik
[rancher-tools]: https://github.com/rawmind0/rancher-tools
