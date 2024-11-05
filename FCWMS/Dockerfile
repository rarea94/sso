# Dockerfile for Laravel Application

# Base PHP image
FROM php:8.2-fpm

# Install system dependencies and PHP extensions required by Laravel
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql zip

# Install Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs

# Set the working directory
WORKDIR /var/www/html

# Copy project files to container
COPY . .

# Install PHP and Node.js dependencies
RUN composer install
RUN npm install

# Set permissions for storage and cache
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Command to run php-fpm
CMD ["php-fpm"]
