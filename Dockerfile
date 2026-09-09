FROM node:20-alpine
# FROM node:20-alpine tells Docker what starting environment (or base image) to use to build your container
WORKDIR /app
# /app sets the working directory for all subsequent commands in the Dockerfile

COPY . .

CMD node test.js