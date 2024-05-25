FROM php:7.1-fpm

# Instalam dependintele pentru a compila modulele de PHP
RUN apt update && \
    apt install -y zip libzip-dev libpng-dev libicu-dev libxml2-dev

# Instalam modulele de PHP suplimentare
RUN docker-php-ext-install mysqli pdo pdo_mysql gd zip intl xml

# Curatam cache-ul APT
RUN apt clean

# Composer nu se impaca prea bine cu userul root, deci vom avea nevoie de un user
ARG uid=1000
ARG user=marius

# creem utilizatorul, directorul pentru composer si stabilim permisiunile
RUN <<EOF
useradd -G www-data,root -u ${uid} -d /home/${user} ${user}
mkdir -p /home/${user}/.composer
chown -R ${user}:${user} /home/${user}
EOF

# Instalam composer din dockerhub
COPY --from=composer:2.2.23 /usr/bin/composer /usr/bin/composer

# configuram directorul de lucru si schimbam utilizatorul
WORKDIR /var/www/src
USER ${user}