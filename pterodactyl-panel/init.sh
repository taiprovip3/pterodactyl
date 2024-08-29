#!/bin/bash
mkdir -p /var/log/supervisord && touch /var/log/supervisord/supervisord.log
supervisord -n -c /etc/supervisord.conf &

sleep 10

apk update # Đối với Alpine Linux (current 3.19)

echo "-----SWITCHING TO MAINTENANCE MODE php artisan down------"
cd /app || exit
php artisan down

cd /tmp || exit
git clone https://github.com/taiprovip3/pterodactyl-plugin-manager.git
cp -R /tmp/pterodactyl-plugin-manager/* /app/

cd /app || exit
yarn
yarn build:production

# Assign permissions
chown -R www-data:www-data /app/*

# Exit script
# clear
php artisan up
echo "-----Thanks to Jexactyl | plugin-manager-addon has been installed and your Panel has been built-----"

wait $(pgrep supervisord)