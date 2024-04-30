#!/usr/bin/env bash

if [ ! $1 ]
then
	echo "Usage $0 [name]"
else
	if [ ! -f $1.crt ]
	then
		openssl genrsa -out $1.key 4096
		openssl req -new -key $1.key -out $1.csr
		openssl x509 -req -in $1.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out $1.crt -days 9999 -sha256
		openssl x509 -inform PEM -in $1.crt -out $1.crt.pem
		openssl rsa -text -in $1.key -out $1.key.pem
	else
		echo "try another name..."
	fi
fi
