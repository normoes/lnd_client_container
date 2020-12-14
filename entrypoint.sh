#!/bin/bash

set -euo pipefail

mkdir /data/lnd
echo "$TLS_CERT" > /data/lnd/tls.cert

echo "Reference:"
echo "https://api.lightning.community/#lnd-rest-api-reference"
echo ""
echo "Example - Check channels:"
echo 'curl -w "\n" -sSL -X GET --cacert /data/lnd/tls.cert -H "Grpc-Metadata-macaroon: $READ_MAC" https://$LND_URL:8080/v1/channels | jq'
echo "Example - Unlock wallet:"
echo 'curl -w "\n" -sSL -X POST --cacert /data/lnd/tls.cert -H "Grpc-Metadata-macaroon: $READ_MAC" https://$LND_URL:8080/v1/unlockwallet -d '"'"'{"wallet_password": "base64_passwd"}'"'"' | jq'
echo "Example - Create invoice:"
echo 'curl -w "\n" -sSL -X POST --cacert /data/lnd/tls.cert -H "Grpc-Metadata-macaroon: $ADMIN_MAC" https://$LND_URL:8080/v1/invoices -d '"'"'{"value_msat": "15000000", "memo": "description of payment"}'"'"' | jq'

exec $@
