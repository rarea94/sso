# Use an official PHP image with required extensions for Laravel
FROM php:8.2-fpm

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-install pdo pdo_mysql gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/FCWMS

# Copy the current directory contents into the container
COPY . .

# Install PHP dependencies using Composer
RUN composer install --no-scripts --no-autoloader

# Run Composer autoload optimization
RUN composer dump-autoload -o

# Give write permissions to storage and bootstrap/cache
RUN chown -R www-data:www-data /var/www/FCWMS/storage /var/www/FCWMS/bootstrap/cache

# Expose the port on which the application runs
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
