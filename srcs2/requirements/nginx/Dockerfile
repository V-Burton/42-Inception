FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install nginx -y && \
    apt-get install openssl -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=vburton.42.fr/UID=vburton"

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY /conf/nginx.conf /etc/nginx/sites-available/vburton.42.fr.conf
RUN ln -s /etc/nginx/sites-available/vburton.42.fr.conf /etc/nginx/sites-enabled/inception.conf

EXPOSE 443

CMD ["nginx"]