#!/bin/bash

set -euo pipefail

mkdir /data/lnd
echo "$TLS_CERT" > /data/lnd/tls.cert

echo "Example:"
echo 'curl -sSL -X GET --cacert /data/lnd/tls.cert -H "Grpc-Metadata-macaroon: $READ_MAC" https://$LND_URL:8080/v1/channels | jq'
