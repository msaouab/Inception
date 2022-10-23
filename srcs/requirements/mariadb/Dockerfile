FROM	debian:buster
RUN	apt-get -y update
RUN	apt-get -y install mariadb-server
RUN	service mysql start

# change	port 127.0.0.1 to default port 0.0.0.0
RUN	sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# change	bind-address
RUN	sed -i 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf
CMD	["mysqld"]
