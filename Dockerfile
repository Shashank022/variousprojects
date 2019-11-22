FROM node:10.13.0-alpine
WORKDIR /app

# Update
RUN apk add --no-cache nodejs npm

# Install app dependencies
COPY package.json ./package.json

RUN npm install

RUN npm run build

EXPOSE  6000

CMD [ "http-server", "dist" ]
