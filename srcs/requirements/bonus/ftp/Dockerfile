FROM	debian:buster

RUN		apt-get -y update

RUN		apt-get -y install vsftpd

COPY	./tools/script.sh /
RUN		chmod +x /script.sh

EXPOSE 5000

ENTRYPOINT [ "tail", "-f", "/dev/null" ]