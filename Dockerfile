FROM composer:1.9 as builder

WORKDIR /app

COPY composer.* ./

RUN composer install

FROM php:7.3-apache

WORKDIR /var/www/

COPY --from=builder /app/vendor /var/www/vendor

COPY . .

COPY public/* /var/www/html/

COPY .env.example .env

RUN chown www-data:www-data ./ -R

ENV APP_NAME 

EXPOSE 80
