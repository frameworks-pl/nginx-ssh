#!/bin/perl

`openssl genrsa -aes256 -out server.key -passout pass:'test' 2048`;

`openssl req -new -key server.key -out server.csr -passin pass:'test' -out server.csr -config server.cnf`;

`openssl x509 -req -days 365 -in server.csr -signkey server.key -passin file:'pass.txt' -out server.crt`;

`mkdir -p /etc/nginx/ssl`;
`cp server.crt /etc/nginx/ssl/server.crt`;
`cp server.key /etc/nginx/ssl/server.key`;
`mkdir -p /var/www/ssh_example`;
`cp index.html /var/www/ssh_example`;

`cp nginx_ssh_config /etc/nginx/sites-available`;
`cd /etc/nginx/sites-enabled && ln -s ../sites-available/nginx_ssh_config nginx_ssh_config`;






