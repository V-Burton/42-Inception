FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install gettext -y && \
    apt-get install nginx -y && \
    apt-get install openssl -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=vburton.42.fr/UID=vburton"

COPY /conf/nginx.conf /etc/nginx/nginx.conf.template
RUN export WP_PATH=$WP_PATH WP_URL=$WP_URL && \
        envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx"]
