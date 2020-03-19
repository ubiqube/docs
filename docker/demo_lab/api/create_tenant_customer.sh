#!/bin/bash
set -x
USER="ncroot"
PASSWORD="ubiqube"
OPERATOR="BLR"

echo "--------------------------------------------------"
echo "CREATE $OPERATOR TENANT AND Tyrell CUSTOMER"  
echo "--------------------------------------------------"

curl -u $USER:$PASSWORD -XPOST http://127.0.0.1/ubi-api-rest/operator/$OPERATOR?name=BladeRunner
curl -u $USER:$PASSWORD -XPOST -H "Content-Type:application/json" -d'{"name":"Tyrell"}' http://127.0.0.1/ubi-api-rest/customer/{$OPERATOR}?name=Tyrell&reference=TyrellCorp
curl -u $USER:$PASSWORD -XPOST -H "Content-Type:application/json" http://127.0.0.1/ubi-api-rest/repository/operator?uri=Process/$OPERATOR
curl -u $USER:$PASSWORD -XPOST -H "Content-Type:application/json" http://127.0.0.1/ubi-api-rest/repository/operator?uri=CommandDefinition/$OPERATOR


