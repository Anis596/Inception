NAME = inception
COMPOSE = docker compose -f srcs/docker-compose.yml

all:
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans

fclean: clean
	sudo rm -rf /home/abensaid42/data/mariadb/*
	sudo rm -rf /home/abensaid42/data/wordpress/*
	docker system prune -af --volumes

re: fclean all

.PHONY: all down clean fclean re
