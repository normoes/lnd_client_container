ARG LND_VERSION="${LND_VERSION:-v0.11.1-beta}"
FROM xmrto/lnd:${LND_VERSION}


WORKDIR /data

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN apk add --no-cache curl jq

ENTRYPOINT ["/entrypoint.sh"]

CMD ["ash"]
