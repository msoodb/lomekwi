#!/bin/bash


curl --version

# -------------------------------------------  common usecase with cURL
# Save the Output to a File
curl -O vue-v2.6.10.js https://cdn.jsdelivr.net/npm/vue/dist/vue.js

# Resume a Download
curl -C - -O https://releases.ubuntu.com/20.04.1/ubuntu-20.04.1-desktop-amd64.iso

# Download Multiple files
curl -O http://mirrors.edge.kernel.org/archlinux/iso/2018.06.01/archlinux-2018.06.01-x86_64.iso  \
     -O https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.4.0-amd64-netinst.iso

# Get the HTTP Headers of a URL
curl -I --http2 https://ubuntu.com/
curl -I --http2 https://www.ubuntu.com/

# Follow Redirects
curl -L google.com

# Change the User-Agent
curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" https://getfedora.org/

# Specify a Maximum Transfer Rate
curl --limit-rate 10k -O https://releases.ubuntu.com/20.04.1/ubuntu-20.04.1-desktop-amd64.iso

# Transfer Files via FTP
curl -u anonymous: ftp://ftp.maangrui.xyz/pub/open_vpn_client/samoor.ovpn
curl -T newfile.tar.gz -u FTP_USERNAME:FTP_PASSWORD ftp://ftp.example.com/

# Send Cookies
curl -L -b "oraclelicense=a" -O http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.rpm

# Using Proxies
curl -x 192.168.44.1:8888 http://linux.com/
curl -U username:password -x 192.168.44.1:8888 http://linux.com/


# -------------------------------------------  Rest API with cURL
# GET
curl --location --request GET "https://reqres.in/api/users?page=2" \
     --header "apikey: 571dff6b-4170-4fc3-9422-9c1b82aa6e37" \
     --header "Accept: application/json , version=2.2.2" 

curl --location --request GET "https://reqres.in/api/users/2" \
     --header "apikey: 571dff6b-4170-4fc3-9422-9c1b82aa6e37" \
     --header "Accept: application/json , version=2.2.2" 


# POST
curl --location --request POST "https://reqres.in/api/users" \
     --header "apikey: 571dff6b-4170-4fc3-9422-9c1b82aa6e37" \
     --header "Accept: application/json , version=2.2.2" \
     --data '{
        "name": "morpheus",                   
        "job": "leader"                       
        }'

curl --location --request POST "https://reqres.in/api/users" \
     --header "apikey: 571dff6b-4170-4fc3-9422-9c1b82aa6e37" \
     --header "Accept: application/json , version=2.2.2" \
     --data @body.json

curl --location --request POST "https://reqres.in/api/users" \
     --data '{
         "email": "eve.holt@reqres.in",
    	 "password": "cityslicka"
	 }'

# PUT
curl --location --request PUT "https://reqres.in/api/users/2" \
     --header "apikey: 571dff6b-4170-4fc3-9422-9c1b82aa6e37" \
     --header "Accept: application/json , version=2.2.2" \
     --data @body.json

# DELETE
curl --location --request DELETE "https://reqres.in/api/users/2" \
