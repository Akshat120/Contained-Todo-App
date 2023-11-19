APP_NAME=contained_todo_app

.PHONY: dkr-build
dkr-build: ## Build the Docker image
	docker build -t $(APP_NAME):latest .

.PHONY: dkr-it
dkr-it: ## Run an interactive shell in the Docker container
	docker run -it $(APP_NAME):latest /bin/sh

.PHONY: dkr-start-app
dkr-start-app: ## Run the Docker container and start the app
	docker run -p 3000:3000 $(APP_NAME):latest ./pre-start.sh


.PHONY: help
help:
	@echo "Available targets:"
	@awk '/^[a-zA-Z0-9_-]+:[[:space:]]*## / {split($$0, a, /:[[:space:]]*## /); printf "  \033[34m%-15s\033[0m - %s\n", a[1], a[2]}' $(MAKEFILE_LIST)
