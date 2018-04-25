FROM alpine:latest
MAINTAINER Denys Vitali <denys@denv.it>
RUN apk update && apk add nodejs git wget curl icu-dev yarn
RUN git clone https://github.com/FruitieX/teleirc /app
WORKDIR /app
RUN npm install .
RUN mkdir -p /root/.teleirc
COPY config.js /root/.teleirc/config.js
EXPOSE 9090
ENTRYPOINT ["npm","start"]
