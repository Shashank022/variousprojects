FROM node:alpine

# install simple http server for serving static content
RUN apk upgrade

# create app working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
#COPY .npmrc .npmrc
COPY package*.json ./

# npm install project dependencies
RUN npm ci

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

ARG node_environment
ENV NODE_ENV ${node_environment:-default}

# build app for production with minification
RUN npm run build

EXPOSE 3200
