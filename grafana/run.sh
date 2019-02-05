docker rm -f grafana
docker run -d --name=grafana -p 3000:3000 grafana/grafana

