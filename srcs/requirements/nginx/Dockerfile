FROM debian:buster
RUN apt-get -y update\
        && apt-get -y install nginx
RUN apt-get -y install vim
RUN apt-get install -y openssl
RUN chmod 777 /etc/ssl/private/ 
RUN  openssl req -x509 -nodes -days 365 -subj "/C=MA/ST=Beni Mellal-Khenifra/L=Khouribga/O=1337 - 42 Network/CN=msaouab.42.fr" -addext "subjectAltName=DNS:msaouab.42.fr" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

#       Country Name (2 letter code) [C] = MA;
#       State or Province Name (full name) [ST] = Beni Mellal-Khenifra;
#       Locality Name (eg, city) [L] = Khouribga;
#       Organization Name (eg, company) [O] = 1337 - 42 Network;
#       Organizational Unit Name (eg, section) [];
#       Common Name (eg, fully qualified host name) [CN] = msaouab.42.fr;
#       Email Address [E]: = ;

COPY	conf/default /etc/nginx/sites-available/
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
