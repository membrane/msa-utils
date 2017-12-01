#!/usr/bin/env bash

kafkacat -P -b localhost:9092 -t shop -p 0 *.json