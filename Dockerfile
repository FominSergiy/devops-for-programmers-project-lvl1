FROM node:14.16

WORKDIR /app
COPY ./app .
RUN npm install