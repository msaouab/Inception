# Inception

## What is it?

* Use docker-compose to create a LEMP stack (L for Linux, E for Nginx, M for Mariadb and P for PHP) with wordpress.

## Objectives

# In Mandatory part, you will build a few images from scratch.
	- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
	- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
	- A Docker container that contains MariaDB only without nginx.
	- A volume that contains your WordPress database.
	- A second volume that contains your WordPress website files.
	- A docker-network that establishes the connection between your containers.

# Bonus list:
	- Set up redis cache for your WordPress website in order to properly manage the cache.
	- Set up a FTP server container pointing to the volume of your WordPress website.
	- Create a simple static website in the language of your choice except PHP (Yes, PHP is excluded!). For example, a showcase site or a site for presenting your resume.
	- Set up Adminer.
	- Set up a service of your choice that you think is useful. During the defense, you will have to justify your choice.

# in this project we must to have:
	- Need VM.
	- All configs in srcs folder.
	- Makefile required and must be located at the root of your directory.
	- It must set up your entire application (i.e., it has to build the Docker images using docker-compose.yml).
	- VM
	- docker-compose

	- Each Docker image must have the same name as its corresponding service.
	- Each service has to run in a dedicated container.
	- For performance matters, the containers must be built either from the penultimate stable version of Alpine Linux, or from Debian Buster. The choice is yours.
	- You also have to write your own Dockerfiles, one per service. 
	- The Dockerfiles must be called in your docker-compose.yml by your Makefile.
	- It means you have to build yourself the Docker images of your project. 
	- It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub (Alpine/Debian being excluded from this rule).

	- You then have to set up:
		- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
		- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
		- A Docker container that contains MariaDB only without nginx.
		- A volume that contains your WordPress database.
		- A second volume that contains your WordPress website files.
		- A docker-network that establishes the connection between your containers.
	- Your containers have to restart in case of a crash.
	- In your WordPress database, there must be two users, one of them being the administrator. The administrator’s username can’t contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth).

To make things simpler, you have to configure your domain name so it points to your local IP address.
This domain name must be login.42.fr. Again, you have to use your own login.
For example, if your login is wil, wil.42.fr will redirect to the IP address pointing to wil’s website

## Steps
- [x] Install Ubuntu Server 20.04.3 LTS VM [here](https://ubuntu.com/download/server)
- [x] Install Docker Engine on Ubuntu [here](https://docs.docker.com/engine/install/ubuntu/)
- [x] Install Docker Compose [here](https://docs.docker.com/compose/install/linux/#install-the-plugin-manually)
- [x] Manage Docker as a non-root user [here](https://docs.docker.com/engine/install/linux-postinstall/)

https://www.howtoforge.com/tutorial/dockerizing-wordpress-with-nginx-and-php-fpm/
- [x] Step 1 - Install Docker
- [x] Step 2 - Install Docker-Compose
- [x] Step 3 - Setup Wordpress
- [x] Step 4 - Configure Docker-Compose
- [x] Step 5 - Run Docker-compose
- [x] Step 6 - Install Wordpress

## clear docker
 - sudo docker system prune -a

## Helps
- Create Certs 
	- [here](https://www.howtogeek.com/devops/how-to-create-and-use-self-signed-ssl-on-nginx/)


## Create Certs
- sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./nginx-selfsigned.key -out ./nginx-selfsigned.crt
	- Country Name (2 letter code) [C] = MA;
	- State or Province Name (full name) [ST] = Beni Mellal-Khenifra;
	- Locality Name (eg, city) [L] = Khouribga;
	- Organization Name (eg, company) [O] = 1337 - 42 Network;
	- Organizational Unit Name (eg, section) [];
	- Common Name (eg, fully qualified host name) [CN] = msaouab.42.fr;
	- Email Address [E]: = ;

## how to test this project
	- clone the repo above.
	- Change the value in the variable `Home` in the `Makefile` and `.env` files
	- run `make` command in your terminal
	- when the the containers running go to the links:
		- https://localhost for page wordpress.
		- https://localhost/wp-admin for dashboard admin in wordpress.
		- https://localhost/index.html for my website.
		- localhost:8080 for adminer
		- localhost:2000 for cadvisor
	- in the terminal you can test the FTP.