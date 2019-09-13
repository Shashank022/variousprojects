FROM alpine:latest

# Update
RUN apk add --no-cache nodejs npm

WORKDIR /app

# Install app dependencies
COPY . /app
RUN npm install

EXPOSE  8000
