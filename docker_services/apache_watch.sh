#!/usr/bin/bash

# acest script se bazeaza pe inotify pentru a verifica daca fisierul de configurare
# apache vhost apache-vhost.conf a fost modificat pe host
# 
# daca da, atunci da reload la apache cu noua configuratie de vhost

while true; do
  inotifywait -e modify /usr/local/apache2/conf/apache_vhost.conf
  apachectl restart
done