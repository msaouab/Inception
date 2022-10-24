FROM	debian:buster

RUN		apt-get -y update
RUN		apt-get -y install mariadb-server

#	to start mysql service
RUN		service mysql start

#	change ip 127.0.0.1 to default 0.0.0.0
RUN		sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

#	change bind-address to 3306
RUN		sed -i 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

#	to keep mariadb container runing
CMD		["mysqld"]
