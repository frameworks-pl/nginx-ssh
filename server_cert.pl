#!/bin/perl

`openssl genrsa -aes256 -out server.key -passout pass:'test' 2048`;

`openssl req -new -key server.key -out server.csr -passin pass:'test' -out server.csr -config server.cnf`;

`openssl x509 -req -days 365 -in server.csr -signkey server.key -passin file:'pass.txt' -out server.crt`;

`cp server.crt /etc/nginx/ssl/server.crt`;
`cp server.key /etc/nginx/ssl/server.key`;






