#!/usr/bin/env bash
LOG="provision-script.log"

sudo apt-get update -y >>/tmp/$LOG 2>&1

echo "Installing: nginx"
sudo apt-get install nginx -y >>/tmp/$LOG 2>&1

echo "Open nginx on port 8888 and autoindex"
sudo rm /etc/nginx/sites-available/default
echo "server {
  listen        8888;
  server_name   _;
  root          /var/www/html;

  location / {
    try_files $uri $uri/ = 404;
    autoindex on;
  }
}" >> /etc/nginx/sites-available/default

echo "Restarting nginx"
sudo /etc/init.d/nginx restart
