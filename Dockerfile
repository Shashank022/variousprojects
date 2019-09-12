FROM alpine:latest

# Update
RUN apk add --no-cache --update nodejs npm

WORKDIR /app

# Install app dependencies
COPY package.json /src/package.json
RUN cd /src; npm install


# Bundle app source
COPY . /src

EXPOSE  8000
CMD ["npm", "start"]