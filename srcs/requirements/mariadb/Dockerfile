From debian:buster

RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/mariadb.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start
RUN mysql -e "CREAT DATABASE IF NOT EXISTS \ `${SQL_DATABASE}\`;"
RUN mysql -e "CREAT USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
RUN mysql -e "GRANT ALL PRIVILEGES ON \ `${SQL_DATABASE}\`. TO \ `${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
RUN mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
RUN mysql -e "FLUSH PRIVILEGES;"
RUN mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
RUN exec mysql_safe
