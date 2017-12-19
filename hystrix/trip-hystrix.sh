#!/usr/bin/env bash

echo 'Performing enough requests to open the circuit'

for i in {1..100}; do
    curl --request POST \
      --url http://localhost:8081/checkouts \
      --header 'content-type: application/json' \
      --data '{
      "customer": "41440721-19db-4a02-8fd8-b6a0f3427d46",
      "items": [
        {
          "article": "cab08236-1924-4f90-975d-9e056ed14c48",
          "quantity": 3
        },
        {
          "article": "d996413a-21fb-4c12-b4a8-64996876505b",
          "quantity": 3
        }
      ]
    }' &
done
