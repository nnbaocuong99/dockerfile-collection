FROM php:7.4-apache AS builder
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install pdo pdo_mysql gd
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html

FROM php:7.4-apache
COPY --from=builder /usr/local/lib/php/extensions /usr/local/lib/php/extensions
COPY --from=builder /usr/local/etc/php/conf.d /usr/local/etc/php/conf.d
COPY --from=builder /var/www/html /var/www/html
RUN a2enmod rewrite
EXPOSE 80
CMD ["apache2-foreground"]