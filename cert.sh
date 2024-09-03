#!/bin/bash

sudo apt install -y certbot python3-certbot-nginx

sudo certbot --nginx -d example.com -d www.example.com

echo "0 3 * * * /usr/bin/certbot renew --quiet" | sudo tee -a /etc/crontab > /dev/null
