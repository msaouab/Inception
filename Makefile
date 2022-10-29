# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msaouab <msaouab@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/07 13:58:51 by msaouab           #+#    #+#              #
#    Updated: 2022/10/29 18:40:46 by msaouab          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOME=/home/msaouab
YELLOW = \033[1;33m
GREEN = \033[1;32m
BLUE = \033[1;34m
RED = \033[1;31m
ED = \033[0m

all: credit up

credit:
	@echo "██╗███╗   ██╗ ██████╗███████╗██████╗ ████████╗██╗ ██████╗ ███╗   ██╗"
	@echo "██║████╗  ██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║"
	@echo "██║██╔██╗ ██║██║     █████╗  ██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║"
	@echo "██║██║╚██╗██║██║     ██╔══╝  ██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║"
	@echo "██║██║ ╚████║╚██████╗███████╗██║        ██║   ██║╚██████╔╝██║ ╚████║"
	@echo "╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo "━━━━━━━━━━━━━━━━━━━━┃By :$(GREEN) msaouab $(ED)┃━━━━━━━━━━━━━━━━━━━━"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

build:
	@echo "$(GREEN)█████████████████████ Build Images ████████████████████$(ED)"
	@docker-compose -f ./srcs/docker-compose.yml build

up:
	@docker-compose -f ./srcs/docker-compose.yml up --build

stop:
	@echo "$(GREEN)███████████████████ Stop Containers ███████████████████$(ED)"
	@docker-compose -f ./srcs/docker-compose.yml stop

start:
	@echo "$(GREEN)███████████████████ Start Containers ███████████████████$(ED)"
	@docker-compose -f ./srcs/docker-compose.yml start

down:
	@echo "$(GREEN)████████████████ Remove all Containers ████████████████$(ED)"
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@echo "$(GREEN)████████████████████ Remove images ████████████████████$(ED)"
	@docker image rmi -f nginx wordpress mariadb adminer

fclean: clean
	@docker image rm -f debian:buster alpine
	@docker volume rm srcs_vl_mariadb srcs_vl_wp
	@rm -rf ../../data/wordpress

re: fclean all
