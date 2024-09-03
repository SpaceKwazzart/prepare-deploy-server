#!/bin/bash
docker network create nginx-proxy

docker run -d --name nginx-proxy --network nginx-proxy --restart always -p 80:80 -p 443:443 \
    -v /etc/nginx/certs:/etc/nginx/certs:ro \
    -v /etc/nginx/vhost.d:/etc/nginx/vhost.d \
    -v /usr/share/nginx/html:/usr/share/nginx/html \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    jwilder/nginx-proxy

docker run -d --name nginx-proxy-letsencrypt --network nginx-proxy --restart always \
    -v /etc/nginx/certs:/etc/nginx/certs \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    --volumes-from nginx-proxy \
    jrcs/letsencrypt-nginx-proxy-companion
