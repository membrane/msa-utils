#!/usr/bin/env bash

kafkacat -P -b localhost:9092 -t shop "$(dirname $0)"/*.json
