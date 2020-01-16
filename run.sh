#!/bin/sh

# Generate credentials and keys
if [ ! -f "$HOME/.ssh/id_rsa.pub" ]; then
    echo -e "\n\n\n" | ssh-keygen -t rsa -b 2048 
fi

export SSH_PUBKEY=$(cat "$HOME/.ssh/id_rsa.pub")
sed -i "5s!.*!SRC=$DR3DEV/files/golang/gopath/src/github.com/brainupdaters!" .env

export $(grep -v '^#' .env | xargs -d '\n')

if [ ! -f "$HOME/.secret/drlm.json" ]; then
	mkdir -p ~/.secret
	echo '{"Username":"root","EncryptedPassword":"AAAAAAAAAACCwvG8+tCwvQ==","type":"","client_x509_cert_url":"","auth_provider_x509_cert_url":""}' >> ~/.secret/drlm.json
	echo '{"Username":"drlm","EncryptedPassword":"AAAAAAAAAACCwvG8+tCwvQ==","PrivateKeyPath":"HOME/.ssh/id_rsa","type":"","client_x509_cert_url":"","auth_provider_x509_cert_url":""}' | awk -v home="$HOME" '{sub("HOME",home,$0); print $0}' >> ~/.secret/drlm-user.json
	echo '{"Username":"root","EncryptedPassword":"AAAAAAAAAACCwvG8+tCwvQ==","type":"","client_x509_cert_url":"","auth_provider_x509_cert_url":""}' >> ~/.secret/db.json
	echo '{"Username":"USER","EncryptedPassword":"AAAAAAAAAACCwvG8+tCwvQ==","PrivateKeyPath":"HOME/.ssh/id_rsa","type":"","client_x509_cert_url":"","auth_provider_x509_cert_url":""}' | awk -v usr="$(whoami)" -v home="$HOME" '{sub("USER",usr,$0); sub("HOME",home,$0); print $0}' >> ~/.secret/godev.json
	echo "$SSH_PUBKEY" >> ~/.ssh/authorized_keys
fi

endly
