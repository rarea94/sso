# Dockerfile pentru fiecare aplicație Laravel
FROM php:8.2-fpm

# Instalăm extensiile necesare pentru Laravel
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql zip

# Instalăm Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY . .

RUN composer install

# Setăm permisiunile necesare pentru directoarele storage și bootstrap/cache
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expunem portul 9000 (php-fpm)
EXPOSE 9000

CMD ["php-fpm"]
