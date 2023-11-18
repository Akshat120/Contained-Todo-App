APP_NAME=contained_todo_app

dkr-build:
	docker build -t $(APP_NAME):latest .

dkr-it:
	docker run -it $(APP_NAME):latest /bin/sh

dkr-start-app:
	docker run -p 3000:3000 $(APP_NAME):latest node /todo-app/server.js
