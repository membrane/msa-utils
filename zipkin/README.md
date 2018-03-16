1. Sampler Percentage hochsetzen
2. Sender type auf Web umstellen - ansonsten werden die Spans bei Kafka dep im CP an ein Topic namens `zipkin` gesendet - Kafka Stream Server ist deprecated und wird aktuell nicht unterstützt; ältere Versionen des Stream Servers lauschen auf dem `sleuth` Topic anstelle `zipkin`.

**application.properties**

```properties
spring.sleuth.sampler.percentage=1.0
spring.zipkin.sender.type=web
```

3. Damit der Servicename korrekt angezeigt wird, muss die Property `spring.application.name` in die Datei

**bootstrap.properties**

```properties
spring.application.name =  catalogue
```

4. anstelle des `msa-zipkin` Projekts sollte das Zipkin Server Shellscript in `msa-utils/scripts/start-zipkin.sh` verwendet werden (kümmert sich automatisch um DL)
5. Anpassung aller übrigen Musterlösungen analog