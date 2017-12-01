#!/usr/bin/env bash

# 1. Perform checkout request

echo 'Performing checkout request'

basket_uuid=$(curl --request POST \
  --url http://localhost:8081/checkouts \
  --header 'content-type: application/json' \
  --data @../data/checkout.json | jq -r .basket) 
# 2. Perform rating request

echo "Performing payment request with basket id $basket_uuid"

