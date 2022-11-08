#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php

mv wp-config-sample.php wp-config.php

sed -i 's/database_name_here/'${DB_NAME}'/g' /var/www/html/wordpress/wp-config.php
sed -i 's/username_here/'${DB_USER}'/g' /var/www/html/wordpress/wp-config.php
sed -i 's/password_here/'${DB_PASSWORD}'/g' /var/www/html/wordpress/wp-config.php
sed -i 's/localhost/'${DB_HOST}'/g' /var/www/html/wordpress/wp-config.php

wp core install --url=https://localhost --title=Inception --admin_user=${WP_ROOT_USER} --admin_password=${WP_PASSWORD} --admin_email=msaouab@student.1337.ma --allow-root
wp user create ${WP_USER} saouab@gmail.com --user_pass=${WP_PASSWORD} --allow-root

sed -i "59i define( 'WP_REDIS_HOST', '$REDIS_HOST' );" /var/www/html/wordpress/wp-config.php
sed -i "60i define( 'WP_REDIS_READ_TIMEOUT', 1 );" /var/www/html/wordpress/wp-config.php
sed -i "61i define( 'WP_REDIS_DATABASE', 0 );" /var/www/html/wordpress/wp-config.php
sed -i "62i define( 'WP_REDIS_PORT', 6379 );" /var/www/html/wordpress/wp-config.php
sed -i "63i define( 'WP_REDIS_TIMEOUT', 1 );" /var/www/html/wordpress/wp-config.php

wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

wp redis enable --allow-root

exec "$@"
