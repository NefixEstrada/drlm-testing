#!/bin/bash

function generateCert() {
    if [ ! -f "/tls/$1/$1.json" ]; then
        mkdir -p /tls/$1

        # Generate the certificate
        ip="ip_$1"
        curl -d '{ "request": {"CN": "'$1'","hosts":["'$1'", "'${!ip}'"], "key": { "algo": "rsa","size": 2048 }, "names": [{"C":"US","ST":"California", "L":"San Francisco","O":"example.com"}]}}' http://0.0.0.0:8888/api/v1/cfssl/newcert > /tls/$1/$1.json

        # Create the private key file
        echo -en "$(cat /tls/$1/$1.json | python3 -m json.tool | grep private_key | cut -f4 -d '"')" > /tls/$1/$1.key

        # Create the certificate file
        echo -en "$(cat /tls/$1/$1.json | python3 -m json.tool | grep -m 1 certificate | cut -f4 -d '"')" > /tls/$1/$1.crt

        # Create the minio certificates
        if [ "$1" == "minio" ]; then
            mv /tls/$1/$1.key /tls/$1/private.key
            mv /tls/$1/$1.crt /tls/$1/public.crt
        fi
    fi
}

for service in "minio" "db" "core"; do
    generateCert $service
done
