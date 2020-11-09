#!/bin/bash


# vpn server: openvpn
sudo dnf install openvpn
mkdir ~/bin/vpn
cd ~/bin/vpn
curl -O  https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
chmod +x openvpn-install.sh

# vpn client: openvpn
sudo dnf install openvpn
sudo cp samoor.ovpn /etc/openvpn/client/samoor.ovpn
sudo openvpn /etc/openvpn/client/samoor.ovpn
