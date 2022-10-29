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

wp core install --url=https://localhost --title=Inception --admin_user=${DB_ROOT_USER} --admin_password=${DB_PASSWORD} --admin_email=msaouab@student.1337.ma --allow-root
wp user create ${DB_USER} saouab@gmail.com --user_pass=${DB_PASSWORD} --allow-root

exec "$@"
