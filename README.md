rancher-traefik
==============

This image is the traefik dynamic conf for rancher. It comes from [rawmind/rancher-tools][rancher-tools].

## Build

```
docker build -t rawmind/rancher-traefik:<version> .
```

## Versions

- `0.3.4-1` [(Dockerfile)](https://github.com/rawmind0/rancher-traefik/blob/0.3.4-1/Dockerfile)
- `0.3.4` [(Dockerfile)](https://github.com/rawmind0/rancher-traefik/blob/0.3.4/Dockerfile)


## Usage

This image has to be run as a sidekick of [rawmind/alpine-traefik][alpine-traefik], and makes available /opt/tools volume. It scans from rancher-metadata, for a services that has traefik labels, and generates traefik frontend and backends to expose the services.


## Configuration labels

Traefik labels, has to be created in your service, in order to get included in traefik dynamic config. 

- traefik.enable = *true | stack | manual | false* #Controls if and how you want to publish or not the service
  - true: the service will be published as *service_name.stack_name.traefik_domain*
  - stack: the service will be published as *stack_name.domain*. WARNING: You can have collisions inside services within yout stack
  - manual: the service frontend will be published as the labels *traefik_domain_prefix.traefik_domain*
  - false: the service will not be published
- traefik.domain	= *Domain names to route rules. Multiple domains separated by ","*
- traefik.port = *port to expose throught traefik*

Optional labels:
- traefik.domain_prefix = *first portion of dns name* **OPTIONAL:** only required if setting traefik.enable to manual. This label sets the first portion of the dns name
- traefik.backend_name = *backend name in traefik rules.toml* **OPTIONAL:** only required if setting traefik.enable to manual. This label sets the name of the backend in the traefik rules.toml
- traefik.https_backend = *true* will set your backend proxy to https. Needed if the service container requires https all the way to the container.

WARNING: Only services with healthy state are added to traefik, so health checks are mandatory.

[alpine-traefik]: https://github.com/rawmind0/alpine-traefik
[rancher-tools]: https://github.com/rawmind0/rancher-tools
