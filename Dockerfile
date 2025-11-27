#Docker file ini salah satunya untuk mengotomatisasi setup aplikasi. 
#selain itu Docker file ini juga untuk membuat konfigurasi di semua server sama.

FROM php:8.2-fpm

# Install packages yang diperlukan
RUN apt-get update && apt-get install -y \
    git curl zip unzip libonig-dev libxml2-dev libzip-dev libicu-dev \
    libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_mysql mbstring xml intl zip gd opcache

# Install composer dari image resmi composer:2 ke dalam container
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Menentukan direktori kerja utama di dalam container
WORKDIR /var/www/html

# Menyalin seluruh source code Laravel dari host ke container
COPY . .

EXPOSE 9000

# Menjalankan PHP-FPM sebagai proses utama dalam container
CMD ["php-fpm"]