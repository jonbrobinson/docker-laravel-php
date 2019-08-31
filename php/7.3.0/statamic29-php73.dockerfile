FROM php:7.3.0-fpm-alpine

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
    &&  apk add --no-cache \
        bash \
        curl \
        git \
        libpng-dev \
        imagemagick \
        mysql-client \
        postgresql-libs \
        libintl \
        icu \
        icu-dev \
        zlib-dev \
    &&  pecl install imagick \
    &&  docker-php-ext-enable imagick \
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
    &&  apk del -f .build-deps

WORKDIR /var/www