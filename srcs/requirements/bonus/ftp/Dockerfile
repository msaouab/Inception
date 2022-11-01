FROM	debian:buster

RUN		apt-get -y update

RUN		apt-get -y install vsftpd

COPY	/conf/vsftpd.conf /etc/vsftpd.conf

COPY	./tools/script.sh /
RUN		chmod +x /script.sh

ENTRYPOINT	[ "/script.sh" ]

CMD	vsftpd