Vorbereitung
====================

npm -g install http-server

Start
====================

run-mongo-elastic.sh

cd java/gravitee/graviteeio-gateway-1.14.3
./bin/gravitee

cd java/gravitee/graviteeio-management-api-1.14.3
./bin/gravitee

cd /java/gravitee/graviteeio-management-ui-1.14.3 
http-server

http://127.0.0.1:8081/

admin
admin


Demo
======================

Maestro: Gravitee Demo

# API Einrichten

Zeigen:
https://api.predic8.de/shop/

APIS: + ( neu)
Create an API from scratch ...

Name: Fruit Shop

Version: 1

Description: Leckere Früchte API

Context-Path: /fruits/

-> Next

Backend: https://api.predic8.de/shop/

-> Next

Name: Trial

Security Type: Keyless

Description: Kostenloser Trafik zum Anfüttern

Max: 3 1 Minute

-> Next

-> SKip

Create and Start the API



# API aufrufen

http://localhost:8082/shop/

3 mal Refresh

=> Meldung anzeigen




# API schützen

APIS Listen

Fruit Shop auswählen


Plans: 

Neuer Plans

Name: Professional

Description: Professional plan for big organisations

-> Next

Authentication Type:

JWT Zeigen

OAuth2

API Key wählen

-> Next

-> Next

-> Save

-> Publish Plan

-> Trial deaktiviern

Gelb: Deploy your API!


# Ausprobieren

Aufruf im Browser



# Subscribe

1. API Gallery

2. Subscribe Shop Plan / Professional

1. Default Application



# Subsription freigeben

1. Tasks in Menu zeigen (1) (Subscriptions)

1. Accept

1. Message: High


# Key Besorgen

1. Applications Links im Menu Klicken / Unten auf Menu achten

2. Subscriptions für diese Application

1. shop

1. API Key kopieren

Achtung " nicht vergessen!

curl http://localhost:8082/shop/

 curl http://localhost:8082/shop -H "X-Gravitee-Api-Key: <<Key>>"

-v

> X-Gravitee-Api-Key: 75c810bd-ef49-43c6-b95b-b249d487d0ee



# Policies

1. APIs. / fruits/

1. Unten Design

1. New +

1. /products/

1. Add

1. Öffnen Kasten1 +/-

1. Transform Headers reinziehen

1. Scope Response   

1. Add

X-ANSWER  42

1. Save

1. Deploy

1. -v





# From Swagger

1. Swagger zeigen

;g6
https://api.predic8.de/shop/swagger

x Create Policies on Path
x With Mocks


1. API +

1. From Link

1. API Liste anzeigen

1. Design

1. Mocks zeigen




Sonstiges:

- Dashboard
- Audit









 curl http://localhost:8082/shop -H "X-Gravitee-Api-Key: 
