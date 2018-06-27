#!/usr/bin/env bash
LOG="provision-script.log"

sudo apt-get update -y >>/tmp/$LOG 2>&1

echo "Installing: nodejs nodejs-dev npm"
curl -sL https://deb.nodesource.com/setup_6.x | bash -
sudo apt-get install nodejs -y >>/tmp/$LOG 2>&1
sudo apt-get install nodejs-dev npm -y >>/tmp/$LOG 2>&1

echo "Installing: yarn"
sudo npm install -g yarn >>/tmp/$LOG 2>&1
