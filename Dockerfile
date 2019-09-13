FROM alpine:latest

# Update
RUN apk add --no-cache nodejs npm

WORKDIR /app

# Install app dependencies
COPY package.json /src/package.json
RUN npm install

EXPOSE  8000

ENTRYPOINT ["node"]

CMD ["npm","serve"]