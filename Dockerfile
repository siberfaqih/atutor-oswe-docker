FROM php:5.6-apache

# Fix old Debian repositories
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list \
 && sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list \
 && sed -i '/stretch-updates/d' /etc/apt/sources.list

# Disable expired signature check
RUN echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check-valid

RUN docker-php-ext-install mysqli mysql

RUN apt-get update -o Acquire::AllowInsecureRepositories=true \
 && apt-get install -y --allow-unauthenticated \
    libpng-dev \
    libjpeg-dev \
    libxml2-dev \
    unzip \
    nano

RUN echo "date.timezone = Asia/Jakarta" > /usr/local/etc/php/conf.d/timezone.ini

COPY atutor/ /var/www/html/

RUN mkdir -p /var/www/html/content \
 && chmod -R 777 /var/www/html/content \
 && chown -R www-data:www-data /var/www/html/content

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
