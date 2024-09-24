FROM composer:2 AS composer
WORKDIR /app
COPY composer.json composer.lock ./
RUN composer install --no-dev --no-scripts --no-autoloader

FROM php:8.0-fpm AS builder
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install pdo pdo_mysql gd
WORKDIR /var/www
COPY . .
COPY --from=composer /app/vendor ./vendor
RUN composer dump-autoload --optimize

FROM php:8.0-fpm
WORKDIR /var/www
COPY --from=builder /var/www .
COPY --from=builder /usr/local/lib/php/extensions /usr/local/lib/php/extensions
COPY --from=builder /usr/local/etc/php/conf.d /usr/local/etc/php/conf.d
RUN chown -R www-data:www-data /var/www
USER www-data
CMD ["php-fpm"]