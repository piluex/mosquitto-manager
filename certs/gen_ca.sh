#!/usr/bin/env bash
if [ ! -f ca.crt ]
then
	openssl genrsa -des3 -out ca.key 4096
	openssl req -x509 -new -nodes -key ca.key -sha256 -days 9999 -out ca.crt
else
	echo "ca.crt exists."
fi
