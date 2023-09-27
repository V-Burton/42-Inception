FROM debian:buster

RUN apt update && apt upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

RUN wget https://github.com/wp-cli/wp-cli/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp

COPY conf/auto_config.sh /var/

CMD ["sh", "/var/auto_config.sh"]

