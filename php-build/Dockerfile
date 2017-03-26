FROM php:7.1.2-fpm

RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libpng12-dev \
	zlib1g-dev \
	libzmq-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install gd

RUN docker-php-ext-install iconv mcrypt

RUN docker-php-ext-install mysqli

RUN docker-php-ext-install pdo pdo_mysql

RUN pecl install --onlyreqdeps --force redis \
	&& rm -rf /tmp/pear \
	&& docker-php-ext-enable redis

RUN pecl install zmq-beta \
    && docker-php-ext-enable zmq

CMD ["php-fpm"]