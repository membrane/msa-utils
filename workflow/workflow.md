<!-- 
Zunächst einmal möchte ich Sie alle zum Microservices Workshop willkommen heißen. Meine Name ist Oliver Weiler, und ich werde Sie die kommenden 4 Tage durch den Workshop begleiten.

Worum geht es? Wir werden eine Reihe Microservices implementieren, wir werden uns ansehen, wo der Unterschied zum klassischen Monolithen besteht, Vorteile, Nachteile, Event Sourcing als alternative zu REST, Probleme synchroner Kommunikation im Backend.

Vielleicht können Sie sich kurz vorstellen, damit ich einen ungefähren Überblick über Ihren Wissensstand erhalte.

...

Voraussetzungen
FOLIEN!
-->

# Workflow

# Erste Schritte mit Kafka und Kafkacat

## Voraussetzungen

* Docker
* kafkacat

### Kafka starten

    $ cd msa-utils/scripts
    $ ./kafka-start.sh

### Bootstrap ausführen

    $ cd msa-utils/bootstrap
    $ ./bootstrap-kafka.sh

### Nachrichten von 'shop' Topic lesen

    $ cd msa-utils/scripts
    $ ./list-kafka.sh

DISKUSSION: Warum Kafka, Kafka vs. klassische Message-Broker

## msa-catalogue

### Voraussetzungen

### Service testen

* Service starten
* Artikelliste abfragen `GET http://localhost:8080/articles`
* Artikelanzahl abfragen `GET http://localhost:8080/articles/count`

### Anlegen von Artikeln implementieren

* POST /articles implementieren, Statuscode 201 mit Location Header
* Speichern in DB
* Schnittstelle testen

### EventSourcing mit Kafka

* Schreiben auf den Bus anstelle in die DB
* Nachrichten auf dem Topic mit `kafkacat` auslesen
* Logausgabe betrachten
* Eventlistener implementieren

DISKUSSION: Warum sollte man nicht zuerst in die DB, und dann auf den Bus schreiben? Ausblick auf alternative
Implementierungsmöglichkeiten, z.B. konkrete Eventtypen.

## Löschen von Artikeln implementieren

* DELETE /articles implementieren

DISKUSSION: Löschen auf dem Commit Log?

### Ändern von Artikeln OPTIONAL

## msa-stock

* Service starten
* Bestandsliste abfragen `GET http://localhost:8081/stocks

## Eventlistener implementieren

* Eventlistener implementieren, Offset bei Neustart zurücksetzen
* neuen Artikel anlegen und Bestandsliste erneut abfragen

DISKUSSION: Besprechung @TopicPartition, @PartitionOffset, Persistenz In-Memory oder DB

## msa-checkout

### CheckoutService implementieren

* REST Template Aufruf implementieren

DISKUSSION: Aufruf hartkodiert. Probleme? Neustart / Umzug des Servers?

### stock-service: Verarbeiten von basket-Events implementieren

* Unterscheidung nach Event-Typen
* Event enthält neuen Zustand

## Service-Discovery mit Consul

* Consul herunterladen
* Consul starten `consul agent -dev`
* Consul UI aufrufen http://localhost:8500/ui

### Spring Cloud Consul einbinden

* in catalogue-service, stock-service und checkout-service einbinden
* Registrierung testen

DISKUSSION: Vorteile?

### Client-seitiges Load-Balancing mit Spring Cloud Ribbon

* RestTemplate Bean mit @LoadBalanced versehen
* anstelle localhost + port service.name verwenden
* Aufruf testen

DISKUSSION: Funktionsweise? Loadbalancing?

* zwei Instanzen von stock-service starten (bei zweiter Instanz über Konfiguration SERVER_PORT setzen)
* Consul UI betrachten
* Aufruf testen

### Das Circuit Breaker Pattern

DISKUSSION: Probleme von (synchronen) (HTTP)-Aufrufen? Das Circuit Breaker Pattern.

* Spring Cloud Hystrix aktivieren
* in CheckoutService Aufruf als @HystrixCommand markieren
* Fallback implementieren
* Fallback testen (StockService abschalten)
* Spring Cloud Dashboard hinzufügen

**TODO** Hystrix Streams aggregieren

## msa-history

* History-Service implementieren

## Metriken mit dem Spring Boot Actuator

* Actuator in catalogue-service integrieren
* Property management.security.enabled auf `false`
* /metrics, /beans, /trace, /env Endpunkte betrachten
* git und Maven Informationen über /info Endpunkt bereitstellen

## Spring Boot Anwendungen administrieren mit Spring Boot Admin

* msa-admin implementieren
* an Service-Discovery anbinden

## Sonstiges

### Consul starten

    $ consul agent -dev

### Consul UI aufrufen

http://localhost:8500/ui

### Kibana aufrufen

http://localhost:5601/app/kibana

### Spring Cloud Sleuth

**spring.application.name** muss in bootstrap.properties gesetzt werden

### Zipkin UI aufrufen

http://localhost:9411/zipkin/

### Prometheus

http://localhost:8081/prometheus
