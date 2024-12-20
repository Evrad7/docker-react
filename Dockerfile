FROM node:16-alpine  AS builder

WORKDIR  /front

COPY ./package.json .

RUN npm install

COPY . /front/

RUN npm run build



FROM nginx:alpine

COPY --from=builder /front/build /usr/share/nginx/html
