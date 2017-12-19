docker rm -f prometheus
docker run -it -p 9090:9090 --name prometheus prometheus
