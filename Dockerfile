FROM node:10.13.0-alpine
# Update
RUN apk add --no-cache nodejs npm

# Install app dependencies
COPY package.json ./package.json
RUN npm install

EXPOSE  8000

CMD ["nginx","-g","daemon off"]