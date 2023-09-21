From debian:buster

RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start; mysql -e "CREAT DATABASE IF NOT EXISTS \ `${SQL_DATABASE}\`;" \
    mysql -e "CREAT USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" \
    mysql -e "GRANT ALL PRIVILEGES ON \ `${SQL_DATABASE}\`. TO \ `${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" \
    mysql -e "FLUSH PRIVILEGES;" \
    mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown \
    exec mysql_safe
