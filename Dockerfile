FROM php:7.3-fpm-alpine

LABEL maintainer="Gytis Tamulynas <Gytis@MPOServices.com>"
LABEL version="1.0.0"
LABEL description="Build and Deploy Laravel Projects"

# Set some environmental variables
ENV COMPOSER_HOME=/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:${COMPOSER_HOME}/vendor/bin"

# Install bash, curl, git, openssh, composer and laravel envoy
RUN apk --no-cache --update add bash \
    curl \
    git \
    openssh \
    rsync \
    && mkdir /composer \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require laravel/envoy --no-progress --no-suggest

RUN mkdir /build
WORKDIR /build

ENTRYPOINT ["/bin/bash"]