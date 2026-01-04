FROM php:7.4-apache

# Install system dependencies for Composer
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (for frameworks)
RUN a2enmod rewrite

# Install Composer globally
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
