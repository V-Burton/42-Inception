FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y install wget && \
    apt-get -y install -y php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp

COPY /tool/auto_config.sh /var/

ENTRYPOINT ["sh", "/var/auto_config.sh"]
EXPOSE 9000