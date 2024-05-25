FROM httpd:2.4

# Copiem fisierul de configurare pentru vhost in container
# acest lucru este necesar pentru a face accesibil php in apache
COPY apache_vhost.conf /usr/local/apache2/conf/apache_vhost.conf
RUN echo "Include /usr/local/apache2/conf/apache_vhost.conf" \
>> /usr/local/apache2/conf/httpd.conf

# instalam dependintele necesare
RUN apt-get update && apt-get install -y \
    vim \
    procps \
    inotify-tools \
    && rm -rf /var/lib/apt/lists/*

# copiem scriptul de watch pentru apache si pornim apache
COPY ./apache_watch.sh /usr/local/bin/apache_watch.sh
RUN chmod +x /usr/local/bin/apache_watch.sh

CMD ["sh", "-c", "/usr/local/bin/apache_watch.sh & httpd-foreground"]