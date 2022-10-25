#!/bin/sh

# Create new user and make it GRANT ALL PRIVILEGES to all DBs in localhost
mysql -u ${DB_ROOT_USER} -e "CREATE DATABASE ${DB_NAME};"
# mysql -u ${DB_ROOT_USER} -e "SHOW DATABASES;"
mysql -u ${DB_ROOT_USER} -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
# mysql -u ${DB_ROOT_USER} -e "SELECT User FROM mysql.user;"
mysql -u ${DB_ROOT_USER} -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u ${DB_ROOT_USER} -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u ${DB_ROOT_USER} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u ${DB_ROOT_USER} -e "FLUSH PRIVILEGES;"

wp core install --url=https://localhost --title=Inception --admin_user=$(DB_ROOT_USER) --admin_password=$(DB_PASSWORD) --admin_email=msaouab@student.1337.ma
# wp user create $(DB_USER) saouab@gmail.com --user_pass=$(DB_PASSWORD)
exec "$@"
