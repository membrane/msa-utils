#!/bin/bash
# Pfad auf lokale Installation anpassen

#~/local/logstash/logstash-6.6.0/bin/logstash -f tcp-json.conf
docker run --rm -it --link msa-elastic:elasticsearch -v `pwd`/tcp-json.conf:/usr/share/logstash/pipeline/logstash.conf -p 5000:5000 docker.elastic.co/logstash/logstash:7.3.2
