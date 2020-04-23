FROM composer:1.9 as builder

WORKDIR /app

COPY composer.* .

RUN composer install

FROM php7.3-apache

WORKDIR /var/www/

COPY --from=builder /app/vendor /var/www/vendor

COPY . .

COPY public /var/www/html


