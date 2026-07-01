#!/bin/bash
set -e

exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1

export DEBIAN_FRONTEND=noninteractive

echo "Starting user data..."

apt-get update -y
apt-get install -y nginx git curl

systemctl enable nginx
systemctl start nginx

rm -rf /var/www/html/*

git clone --depth 1 https://github.com/startbootstrap/startbootstrap-agency.git /tmp/startbootstrap-agency

cp -a /tmp/startbootstrap-agency/dist/. /var/www/html/

rm -rf /tmp/startbootstrap-agency
    
chown -R www-data:www-data /var/www/html

systemctl restart nginx
 
echo "User data completed successfully."