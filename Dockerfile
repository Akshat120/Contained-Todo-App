# Import alpine image
FROM alpine:latest

# Install packages
RUN apk --update add \
    nodejs \
    npm \
    && rm -rf /var/cache/apk/*

# Changing working dir to root
WORKDIR /

# Copying todo-app in the root
COPY ./todo-app ./todo-app

# Changing working dir to todo-app
WORKDIR /todo-app

# Install node-packages 
# add node_modules folder inside todo-app
RUN npm install
