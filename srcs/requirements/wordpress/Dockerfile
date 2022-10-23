FROM	debian:buster

RUN	apt-get -y update
RUN	apt-get -y install vim\
	git\
	curl\
	php-fpm\
	php-cgi\
	php-mysql

# COPY	./tools/script.sh /
# RUN		chmod +x script.sh
#ADD tools/entry.sh /tmp/entry.sh
#RUN chmod +x /tmp/entry.sh
#ADD conf/wp-config.php /tmp/wp-config.php
#ADD conf/www.conf /tmp/www.conf
# CMD	["/script.sh"]


ENTRYPOINT	["tail", "-f", "/dev/null"]
