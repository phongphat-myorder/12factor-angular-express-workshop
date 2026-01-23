SHELL := /bin/bash
.SHELLFLAGS := -c

MONGO_DB = mongosh --host localhost --port 27017 

.PHONY: start npm-install build build-front build-back build-compose build-compose-back build-compose-front run-front run-back

help:
	@echo "Makefile for 12 Factor App with Angular and Express"
	@echo ""
	@echo "Available commands:"
	@echo "  make start                 - Clone the frontend and backend repositories"
	@echo "  make npm-install           - Install npm packages for both frontend and backend"
	@echo "  make build                 - Build both frontend and backend applications"
	@echo "  make build-front           - Build only the Angular frontend application"
	@echo "  make build-back            - Build only the Express backend application"
	@echo "  make build-compose         - Build and run all services using docker-compose"
	@echo "  make build-compose-back    - Build and run only the backend service using docker-compose"
	@echo "  make build-compose-front   - Build and run only the frontend service using docker-compose"
	@echo "  make run-front             - Start the Angular frontend application"
	@echo "  make run-back              - Start the Express backend application"
	@echo "  make down                  - Stop all running docker-compose services"

start:
	@echo "Start clone repository... 👁👄👁"
	git clone git@github.com:phongphat-myorder/RVE-frontend-repo.git
	git clone git@github.com:phongphat-myorder/RVE-backend-repo.git

npm-install:
	@echo "Install npm packages from frontend... 📲"
	cd RVE-frontend-repo && npm install && npm audit fix --force
	@echo "Install npm packages... 📲"
	cd RVE-backend-repo && npm install

build:
	@echo "Build App Full... 🌗"
	cd RVE-frontend-repo && npm run build && cd ../RVE-backend-repo && npm run build

build-front:
	@echo "Build Angular Frontend... 🌕"
	cd RVE-frontend-repo && npm run build

build-back:
	@echo "Build Express Backend... 🌑"
	cd RVE-backend-repo && npm run build

build-compose:
	@echo "Build docker-compose All in one... 🐳"
	make build-compose-front
	make build-compose-back

build-compose-back:
	@echo "Build backend service... 🐳🌑"
	docker-compose -f "./RVE-backend-repo/docker-compose.yml" up -d --build

build-compose-front:
	@echo "Build frontend service... 🐳🌕"
	docker-compose -f "./RVE-frontend-repo/docker-compose.yml" up -d --build 

run-front:
	@echo "Run Angular Frontend... 🏃‍♂️🌕"
	cd RVE-frontend-repo && npm run start

run-back:
	@echo "Run Express Backend... 🏃‍♂️🌑"
	cd RVE-backend-repo && npm run start

down:
	@echo "Write-Output 'down...🛬'"
	docker-compose -f "./RVE-frontend-repo/docker-compose.yml" down
	docker-compose -f "./RVE-backend-repo/docker-compose.yml" down
	