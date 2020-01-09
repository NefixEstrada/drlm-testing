#!/bin/sh

if [ ! -f /tls/ca/ca.pem ]; then
        mkdir -p /tls/ca
        cfssl print-defaults config > /tls/ca/ca-config.json
        cfssl print-defaults csr > /tls/ca/ca-csr.json
        cd /tls/ca
        cfssl genkey -initca ca-csr.json | cfssljson -bare ca
        cd
fi

cfssl serve -ca=/tls/ca/ca.pem -ca-key=/tls/ca/ca-key.pem -address=0.0.0.0&
