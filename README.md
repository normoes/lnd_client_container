# LND test client container

This is just a helper container that can be configured to allow interacting with a lightning daemon.

It expects the container to be run with the environment variale `TLS_CERT`.

On container creation the value of `TLS_CERT` will be copied into `/data/lnd/tls.cert`.

```
docker run --rm -it -e TLS_CERT="$(pass show work/CSS/sideprojects/lnd_develop/tls_cert)" --name lnd_test normoes/lnd_client_container
```

The next is jsut my personal work flow.

I also set the following environment variables:
* `READ_MAC` (the default readonly macaroon)
* `WRITE_MAC` (a custom macaroon)
* `LND_URL` (URL of the lightning dameon)
* `PASSWD` (base64 encoded wallet password e.g. when unlocking the wallet)

This way I can run shorter commands in the cli:
```
curl -sSL -X GET --cacert /data/lnd/tls.cert -H "Grpc-Metadata-macaroon: $READ_MAC" https://$LND_URL:8080/v1/channels | jq
```

---

On container creation `curl` and `jq` will be installed.
