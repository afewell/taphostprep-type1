#!/bin/bash
## Create Private Key for CA
mkdir -p "/home/${user}/.pki/ca"
openssl genrsa -out "/home/${user}/.pki/ca/ca.key" 4096
## Create CA Cert
openssl req -x509 -new -nodes -key "/home/${user}/.pki/ca/ca.key" -reqexts v3_req \
 -extensions v3_ca -config "/home/${user}/taphostprep-type1/assets/opensslv3.cnf" -sha256 -days 1825 \
 -subj "/C=CN/ST=Washington/L=Seattle/O=VMware/OU=mamburger/CN=tanzu.demo" \
 -out "/home/${user}/.pki/ca/ca.pem"
## Set {user} as owner of cert files
chown -R "${user}:" "/home/${user}/.pki/"
## Copy certs to minikube
mkdir -p "/home/${user}/.minikube/certs/"
sudo cp "/home/${user}/.pki/ca/ca.pem" "/home/${user}/.minikube/certs/ca.pem"
## Install root CA cert in ubuntu trust store so localhost trusts CA
apt install -y ca-certificates
cp "/home/${user}/.pki/ca/ca.pem" /usr/local/share/ca-certificates
ln -s "/home/${user}/.pki/ca/ca.pem" /etc/ssl/certs/cacert.pem
update-ca-certificates