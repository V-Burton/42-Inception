From debian:buster

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_DATABASE
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD
ARG USER

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y

# Give permission to mysql group
RUN mkdir -p /var/run/mysql
RUN chown -R mysql:mysql /var/run/mysql

RUN service mysql start
# RUN service mysql start -e && mysql -u root -e "CREAT DATABASE IF NOT EXISTS $SQL_DATABASE; \
# 			 CREAT USER IF NOT EXISTS $SQL_USER@'localhost' IDENTIFIED BY '$SQL_PASSWORD'; \
# 			 GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; \
# 			 ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; \
# 			 -e FLUSH PRIVILEGES;" && \
# 			 mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

COPY conf/mariadb.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

RUN apt install dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["mysqld"]
