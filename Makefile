# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msaouab <msaouab@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/07 13:58:51 by msaouab           #+#    #+#              #
#    Updated: 2022/11/05 09:01:48 by msaouab          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

bold = $(shell tput bold)

RED = \033[1;31m
GREEN = \033[1;32m
YELLOW = \033[1;33m
BLUE = \033[1;34m
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
	@echo "━━━━━━━━━━━━━━━━━━━━━┃ By :$(GREEN) msaouab $(ED)┃━━━━━━━━━━━━━━━━━━━━━"
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
	@docker image rmi -f nginx wordpress mariadb adminer ftp redis telnet website

fclean: clean
	@rm -rf /Users/msaouab/Desktop/data/wordpress
	@docker volume rm srcs_vl_mariadb srcs_vl_wp

re: fclean all
