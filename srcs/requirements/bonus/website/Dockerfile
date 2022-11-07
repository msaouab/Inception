FROM	alpine

RUN		apk update 
RUN		apk add apache2 openrc git
RUN		openrc
RUN		touch /run/openrc/softlevel

ADD		/tools/website /var/www/html/wordpress/

ENTRYPOINT	[ "/usr/sbin/httpd", "-D", "FOREGROUND"]