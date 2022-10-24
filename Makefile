# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msaouab <msaouab@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/07 13:58:51 by msaouab           #+#    #+#              #
#    Updated: 2022/10/24 17:02:44 by msaouab          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOME=/home/msaouab
YELLOW = \033[1;33m
GREEN = \033[1;32m
BLUE = \033[1;34m
RED = \033[1;31m
NC = \033[0m

all: credit build up
	@docker-compose -f ./srcs/docker-compose.yml up --build

credit:
	@echo "██╗███╗   ██╗ ██████╗███████╗██████╗ ████████╗██╗ ██████╗ ███╗   ██╗"
	@echo "██║████╗  ██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║"
	@echo "██║██╔██╗ ██║██║     █████╗  ██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║"
	@echo "██║██║╚██╗██║██║     ██╔══╝  ██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║"
	@echo "██║██║ ╚████║╚██████╗███████╗██║        ██║   ██║╚██████╔╝██║ ╚████║"
	@echo "╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo "━━━━━━━━━━━━━━━━━━━━┃By :$(GREEN) msaouab $(NC)┃━━━━━━━━━━━━━━━━━━━━"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

build:
	@echo "$(GREEN)█████████████████████ Build Images ████████████████████$(NC)"
	@docker-compose -f ./srcs/docker-compose.yml build

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	@echo "$(GREEN)███████████████████ Stop Containers ███████████████████$(NC)"
	@docker-compose -f ./srcs/docker-compose.yml down

start:
	@echo "$(GREEN)███████████████████ Start Containers ███████████████████$(NC)"
	@docker-compose -f ./srcs/docker-compose.yml start

down:
	@echo "$(GREEN)████████████████ Remove all Containers ████████████████$(NC)"
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@echo "$(GREEN)████████████████████ Remove images ████████████████████$(NC)"
	@docker image rmi -f nginx wordpress mariadb

fclean: clean
	@docker image rm -f debian:buster

re: fclean all