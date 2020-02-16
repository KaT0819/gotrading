.PHONY: all

DOCKER  ?= docker
DOCKER_COMPOSE  ?= docker-compose
DOCKER_HOST_IP ?= 127.0.0.1
OPEN_CMD ?= open
GROUP ?= all
PROJECT_NAME ?= gotrading
DOCKER_EXEC_WEB ?= $(DOCKER_COMPOSE) -p $(PROJECT_NAME) exec $(PROJECT_NAME)_web
DOCKER_EXEC_DB ?= $(DOCKER_COMPOSE) -p $(PROJECT_NAME) exec $(PROJECT_NAME)_db

build: docker-build
up: docker-up
kill: docker-kill
# migrate: db-migrate db-seed
clean: docker-kill docker-clean
# test: test-setup test-run
all: clean build up

## docker-build: docker build images
docker-build:
	$(DOCKER_COMPOSE) build --force-rm
## docker-up: docker start stack
docker-up:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) up -d
## docker-kill: docker kill process
docker-kill:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) kill
## docker-clean: docker remove all containers in stack
docker-clean:
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME) rm -fv --all
	$(DOCKER_COMPOSE) down --rmi local --remove-orphans

## web-bash: web container bash
web-bash:
	$(DOCKER_EXEC_WEB) bash
## db-bash: db container bash
db-bash:
	$(DOCKER_EXEC_DB) bash

## go-build: go build
go-build:
	$(DOCKER_EXEC_WEB) go build -o $(PROJECT_NAME) main.go

## go-test: テスト実行   
go-test:
	$(DOCKER_EXEC_WEB) echo 'go test -v .'

## go-covarage: カバレッジの計測
go-covarage:
	$(DOCKER_EXEC_WEB) go test -v . -coverprofile=cover.out
	$(DOCKER_EXEC_WEB) echo 'go tool cover cover.out'

## go-clean: go clean
go-clean:
	$(DOCKER_EXEC_WEB) go clean

## run: go run
run:
	$(DOCKER_EXEC_WEB) go run main.go

## sqlite: sqlite connect
sqlite:
	sqlite3 ./stockdata.sql

localci:
	circleci local execute


.PHONY: setup
## setup: setup go modules
setup:
	@go mod init \
		&& go mod tidy \
		&& go mod vendor

.PHONY: help
## help: prints this help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
