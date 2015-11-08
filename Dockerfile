FROM sillelien/base-alpine:0.10

MAINTAINER Michael Dimmock <https://github.com/michaeldim>

# Install packages
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk-install nginx \
    bash \
    curl \
    git \
    php-cli \
    php-curl \
    php-dom \
    php-gd \
    php-fpm \
    php-json \
    php-mcrypt \
    php-mysql \
    php-pdo_mysql \
    php-phar \
    phpredis@testing \
    php-openssl && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/ && \
    rm -Rf /var/www/*

# Add configuration files
ADD rootfs /

# Fix permissions
RUN chown -Rf nginx:www-data /var/www/

# Set working directory
WORKDIR /var/www

# Expose the ports for nginx
EXPOSE 80 443
