FROM composer:2 AS composer

FROM php:8.2-alpine

# Inspired by official "composer" docker image
RUN apk --no-cache add curl git subversion openssh openssl mercurial tini bash libzip-dev zlib-dev libpng-dev icu-dev $PHPIZE_DEPS imagemagick

RUN echo "memory_limit=-1" > "$PHP_INI_DIR/conf.d/memory-limit.ini" \
 && echo "date.timezone=${PHP_TIMEZONE:-UTC}" > "$PHP_INI_DIR/conf.d/date_timezone.ini"

# Install some php modules so we can use this image to run functional tests
RUN docker-php-ext-install zip mysqli gd intl

# https://gist.github.com/johndatserakis/825a16a7f3cef4e8b4dbfbb1e80b9f9c#gistcomment-3110335
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions imagick soap xdebug-^3

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp
WORKDIR /app

# Inspired by "t3easy/surf:gulp" docker image
RUN apk --no-cache add rsync nodejs yarn

# install gulp-cli as global module
RUN yarn global add gulp-cli \
    && touch ~/.dummy \
    && yarn cache clean \
    && rm -f ~/.dummy

# copy composer from official composer image
COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV PATH "/tmp/vendor/bin:$PATH"

# Install typo3/surf
RUN composer global require typo3/surf:^2 \
    && composer clear-cache

CMD ["/bin/ash"]
