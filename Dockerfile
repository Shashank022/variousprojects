FROM node:10.13.0-alpine
WORKDIR /app

# Update
RUN apk add --no-cache nodejs npm

# Install app dependencies
COPY package.json ./package.json

RUN npm i -g npm-check-updates

RUN npm-check-updates -u

RUN npm install --no-bin-links

RUN npm update

EXPOSE  7000

CMD [ "npm", "run","serve" ]
