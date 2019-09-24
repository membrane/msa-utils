#!/bin/bash
docker run --link msa-elastic:elasticsearch -p 5601:5601 docker.elastic.co/kibana/kibana:7.3.2
