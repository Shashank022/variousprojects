FROM node:10.13.0-alpine
WORKDIR /app

# Update
RUN apk add --no-cache nodejs npm

# Install app dependencies
COPY package.json ./package.json
RUN npm install

RUN npm update 


EXPOSE  5000

CMD ["npm","run","serve"]