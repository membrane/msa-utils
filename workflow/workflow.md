# Workflow

## Voraussetzungen

* Docker
* kafkacat

## Kafka starten

    $ cd msa-utils/scripts
    $ ./kafka-start.sh

## Consul starten

    $ cd msa-utils/scripts
    $ ./consul-start.sh

## Catalogue-Service starten

## Bootstrap ausführen

    $ cd msa-utils/bootstrap
    $ ./bootstrap-kafka.sh

## Nachrichten von 'shop' Topic lesen

    $ cd msa-utils/scripts
    $ ./list-kafka.sh

## Consul starten

    $ consul agent -dev

## Consul UI aufrufen

http://localhost:8500/ui

## Kibana aufrufen

http://localhost:5601/app/kibana

# Spring Cloud Sleuth

**spring.application.name** muss in bootstrap.properties gesetzt werden