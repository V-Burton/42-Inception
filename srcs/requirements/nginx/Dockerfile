From debian:buster

RUN apt update && apt upgrade -y
RUN apt install	nginx -y
RUN apt install	vim -y
RUN apt install	curl  -y

RUN	mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/vburton42.fr.crt -keyout /etc/nginx/ssl/vburton42.fr.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=vburton.42.fr/UID=login"
RUN mkdir -p /var/run/nginx

RUN rm /etc/nginx/sites-enabled/default
COPY conf/nginx.conf /etc/nginx/sites-available/vburton.42.fr.conf
RUN ln -s /etc/nginx/sites-available/vburton.42.fr.conf /etc/nginx/sites-enabled/vburton.42.fr.conf

EXPOSE 443

RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]


RUN chmod 755 /var/run/nginx
RUN chown -R www-data:www-data /var/run/nginx

CMD [ "nginx", "-g", "daemon off;" ]
