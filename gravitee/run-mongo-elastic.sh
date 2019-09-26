docker rm -f gravitee-mongo gravitee-elastic

docker run --name gravitee-mongo -p 27017:27017 -d mongo

docker run -d --name gravitee-elastic -p 9200:9200 elasticsearch:6.5.4
