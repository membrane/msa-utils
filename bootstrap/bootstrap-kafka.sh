#!/usr/bin/env bash

kafkacat -P -b localhost:9092 -t shop *.json