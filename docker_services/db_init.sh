#!/bin/bash
# Crearea fișierului .my.cnf în /root
cat > /root/.my.cnf <<EOF
[client]
user=root
password=$MYSQL_ROOT_PASSWORD
EOF

# Setarea permisiunilor pentru fișier
chmod 600 /root/.my.cnf

# Executarea comenzii originale de pornire a MariaDB
docker-entrypoint.sh mysqld