FROM alpine:3.18.4
COPY update.sh /usr/local/bin/update.sh
COPY healthcheck.sh /usr/local/bin/healthcheck.sh
RUN apk add --no-cache ca-certificates tzdata tini curl jq && \
    chmod -R 777 /tmp

ENV UI=30s

USER nobody
ENTRYPOINT ["tini", "--", "update.sh"]
HEALTHCHECK CMD healthcheck.sh || exit 1
