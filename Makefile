all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f srcs/docker-compose.yml up -d --build

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

status : 
	@docker ps

clean:
	stop;\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

.PHONY: all down re start stop status clean