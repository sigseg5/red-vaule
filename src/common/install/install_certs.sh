#!/usr/bin/env bash
set -e

echo "Installing Russian Trusted CA"

# Download Russian Trusted Root CA
curl https://gu-st.ru/content/lending/russian_trusted_root_ca_pem.crt -o ~/russian_trusted_root_ca_pem.crt

# Download sub certificates
curl https://gu-st.ru/content/lending/russian_trusted_sub_ca_pem.crt -o ~/russian_trusted_sub_ca_pem.crt

# Initialize nssdb
mkdir -p $HOME/.pki/nssdb
certutil -d $HOME/.pki/nssdb -N

echo "nssdb initialized successfully"

certutil -d sql:$HOME/.pki/nssdb/ -A -t "C,," -n "russian_trusted_root_ca_pem" -i ~/russian_trusted_root_ca_pem.crt
certutil -d sql:$HOME/.pki/nssdb/ -A -t "C,," -n "russian_trusted_sub_ca_pem" -i ~/russian_trusted_sub_ca_pem.crt

echo "Cerificates added to nssdb succesfully"

rm ~/russian_trusted_root_ca_pem.crt ~/russian_trusted_sub_ca_pem.crt

echo "Russian Trusted CA installed successfully"
