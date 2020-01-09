FROM golang:alpine AS builder

RUN apk add --no-cache \
        musl-dev \
        gcc \
        git

RUN go get -u github.com/cloudflare/cfssl/cmd/...

FROM panubo/sshd

RUN apk add --no-cache \
        curl \
        python3 \
        bash

COPY --from=builder /go/bin/* /usr/local/bin/
COPY generate-certs.sh /usr/local/bin/

EXPOSE 8888
