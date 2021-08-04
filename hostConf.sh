#! /bin/bash

sudo a2enmod proxy
sudo a2enmod proxy_http


cp ./moms.local.conf /etc/apache2/sites-available/moms.local.conf 

sudo a2ensite moms.local.conf

echo "127.0.0.1  moms.local" | sudo tee -a /etc/hosts

sudo systemctl restart apache2