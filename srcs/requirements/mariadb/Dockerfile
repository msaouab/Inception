FROM	alpine

RUN apk update \
	apk apk add mariadb mariadb-client

RUN		apk add openrc
# RUN 	apk add mysql mysql-client
RUN		openrc
RUN 	touch /run/openrc/softlevel

RUN		apk add mariadb

COPY	./conf/wp.sql /

COPY	./tools/script.sh /
RUN		chmod +x /script.sh

ENTRYPOINT	[ "/script.sh" ]
