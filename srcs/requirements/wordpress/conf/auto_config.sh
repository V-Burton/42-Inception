sleep 10;

wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --allow-root --url=$DOMAIN_NAME --title=SQL_DATABASE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_mail=$EMAIL

wp user create --allow-root $USER $USER_EMAIL --password=USER_PASSWORD

mkdir -p /run/php/

/usr/sbin/php-fpm7.3 -F
