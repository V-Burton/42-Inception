FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y install wget && \
    apt-get -y install -y php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www   
# RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# RUN		chown -R root:root /var/www/wordpress

# RUN chown -R www-data:www-data /var/www/wordpress

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp

COPY /tool/auto_config.sh /var/

# CMD ["bash", "/var/auto_config.sh"]

ENTRYPOINT ["sh", "/var/auto_config.sh"]
EXPOSE 9000