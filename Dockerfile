FROM jguyomard/hugo-builder AS build

WORKDIR /
COPY ./ ./

RUN hugo

FROM nginx:latest

COPY ./docker/nginx/conf.d/victorhugo.dev.conf /etc/nginx/conf.d/default.conf

COPY --from=build ./public/ /var/www/html/vhdev/

EXPOSE 80