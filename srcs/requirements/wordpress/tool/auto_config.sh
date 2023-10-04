sleep 5
chmod -R 775 /var/www/wordpress;


if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    
    wp core download --path=$WP_PATH --allow-root

    wp config create	--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 \
                        --allow-root \
                        --path=$WP_PATH

    wp core install --url=$WP_URL \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN_USER \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --allow-root \
                    --path=$WP_PATH

    wp user create $WP_USER $WP_USER_EMAIL \
                    --allow-root \
                    --path=$WP_PATH
fi

mkdir -p /run/php/
/usr/sbin/php-fpm7.4 -F