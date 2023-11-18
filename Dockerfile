# Import alpine image
FROM alpine:latest

# Install packages
RUN apk --update add \
    curl \
    nodejs \
    npm \
    && rm -rf /var/cache/apk/*

# Changing working dir to root
WORKDIR /

# Copying todo-app in the root
COPY ./todo-app ./todo-app

# Changing working dir to todo-app
WORKDIR /todo-app

RUN chmod +x pre-start.sh

# Install node-packages 
# add node_modules folder inside todo-app
RUN npm install
