#!/bin/bash


"' 
Localtunnel allows you to easily share a web service on your
local development machine without messing with DNS and firewall settings.
'"

# Install Localtunnel globally (requires NodeJS)
sudo npm install -g localtunnel

# Start a webserver on some local port (eg http://localhost:8000)
cd project_folder/
npm run server

# Use the command line interface to request a tunnel to your local server
lt --port 8000
