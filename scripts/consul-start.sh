docker rm -f consul
docker run -d --name=consul -e CONSUL_BIND_INTERFACE=eth0 -p 8500:8500 consul