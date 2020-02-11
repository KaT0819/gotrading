.PHONY: all

DOCKER  ?= docker
DOCKER_COMPOSE  ?= docker-compose
DOCKER_HOST_IP ?= 127.0.0.1
OPEN_CMD ?= open
GROUP ?= all
PROJECT_NAME ?= gotrading

build: docker-build
up: docker-up
kill: docker-kill
migrate: db-migrate db-seed
clean: docker-kill docker-clean
test: test-setup test-run

docker-build:	##@development build images
	$(DOCKER_COMPOSE) build --force-rm
docker-up:		##@development start stack
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) up -d
docker-kill:	##@development kill process
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) kill
docker-clean:	 ##@development remove all containers in stack
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) rm -fv --all
	$(DOCKER_COMPOSE) down --rmi local --remove-orphans


web-bash:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) exec $(PROJECT_NAME)_web bash
db-bash:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) exec $(PROJECT_NAME)_db bash

run:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) exec $(PROJECT_NAME)_web go run main.go

localci:
	circleci local execute

all: clean build up
