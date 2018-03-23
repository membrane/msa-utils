docker rm -f prometheus
docker run -it --net=host -p 9090:9090 --name prometheus prometheus
