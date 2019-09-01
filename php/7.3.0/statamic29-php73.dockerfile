FROM php:7.3.8-fpm-alpine

MAINTAINER Jonathan Robinson <jonrobinson.codes@gmail.com>

RUN apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        curl-dev \
        imagemagick-dev \
        libtool \
        libxml2-dev \
        postgresql-dev \
        sqlite-dev \
        libzip-dev \
        libcurl \
        php7-zlib \
        php7-zip \
    &&  apk add --no-cache \
        bash \
        curl \
        git \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        imagemagick \
        mysql-client \
        postgresql-libs \
        libintl \
        icu \
        icu-dev \
    &&  pecl install imagick \
    &&  docker-php-ext-enable imagick \
    &&  docker-php-ext-configure zip --with-libzip \
    &&  docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    &&  docker-php-ext-install \
        curl \
        iconv \
        mbstring \
        pdo \
        pdo_mysql \
        pdo_pgsql \
        pdo_sqlite \
        pcntl \
        tokenizer \
        xml \
        intl \
        gd \
        zip \
        exif \
    &&  apk del -f .build-deps

WORKDIR /var/www