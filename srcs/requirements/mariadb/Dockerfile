From debian:buster

ARG SQL_DATABASE SQL_USER SQL_PASSWORD SQL_ROOT_PASSWORD


RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; \
                        CREATE USER IF NOT EXISTS $SQL_USER @'localhost' IDENTIFIED BY '$SQL_PASSWORD'; \
                        GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%' IDENTIFIED BY '$SQL_PASSWORD'; \
                        ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; \
                        FLUSH PRIVILEGES;" &&  \
                        mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

CMD ["mysqld_safe"]
