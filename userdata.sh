#!/bin/bash
set -e

exec >>/var/log/user-data.log 2>&1

export DEBIAN_FRONTEND=noninteractive

echo "Starting user data" 
apt-get update -y
apt-get install -y nginx git curl
systemctl enable nginx
systemctl start nginx
rm -rf /var/www/html/*
git clone --depth 1 https://github.com/startbootstrap/startbootstrap-agency.git /tmp/startbootstrap-agency || true
cp -a /tmp/startbootstrap-agency/. /var/www/html/ || true
rm -rf /tmp/startbootstrap-agency || true
chown -R www-data:www-data /var/www/html
systemctl restart nginx
systemctl status nginx --no-pager | head -20