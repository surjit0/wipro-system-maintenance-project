FROM alpine:3.20
RUN apk add --no-cache bash coreutils tar gzip procps findutils
WORKDIR /suite
COPY bin ./bin
COPY run.sh .
COPY config ./config
RUN chmod +x run.sh bin/*.sh && mkdir -p /suite/logs
ENTRYPOINT ["./run.sh"]
