#!/bin/bash

# deploy python project
# this project is already on github
sudo dnf update
sudo dnf install git
~/.ssh/ssh-keygen

cat id_rsa.pub #=> copy id_rsa_pub to deploy key in your github project
cd ~/Projects
git clone git@github.com:msoodb/api.maangrui.git
cd api.maangrui
cat README.md # to follow installation process
nohup python3 -u <script> </dev/null >/dev/null 2>&1 &



# Vue.js front-end project
npm install      # in development machin
npm run build    # in development machin
scp -i ~/.ssh/id_rsa_personal -r /home/masoud/Projects/maangrui/dist/*  samoor@207.154.212.102:/var/www/maangrui.xyz

