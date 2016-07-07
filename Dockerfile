FROM rawmind/rancher-tools:0.3.4-3
MAINTAINER Raul Sanchez <rawmind@gmail.com>

#Set environment
ENV SERVICE_NAME=traefik \
    SERVICE_USER=traefik \
    SERVICE_UID=10001 \
    SERVICE_GROUP=traefik \
    SERVICE_GID=10001 

# Add service files
ADD root /
