FROM composer:2 AS composer

FROM debian:bullseye-slim

# add php package resources
RUN apt-get update \
	&& apt-get install apt-transport-https gnupg curl -y \
	&& curl https://packages.sury.org/php/apt.gpg | apt-key add - \
	&& echo 'deb https://packages.sury.org/php/ bullseye main' > /etc/apt/sources.list.d/php.list \
	&& apt-get update --fix-missing

# install non-php packages
RUN apt-get install rsync git unzip npm nodejs imagemagick -y

# install yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
ENV PATH "/root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH"

# install gulp-cli as global module
RUN yarn global add gulp-cli \
	&& touch ~/.dummy \
	&& yarn cache clean \
	&& rm -f ~/.dummy

# add php packages
RUN apt-get install php8.0-cli php8.0-xml php8.0-gd php8.0-mbstring php8.0-curl php8.0-zip php8.0-mysqli php8.0-intl php8.0-imagick php8.0-sqlite php8.0-soap php8.0-xdebug -y \
	&& echo "xdebug.mode=coverage" >> /etc/php/8.0/cli/conf.d/20-xdebug.ini

# install composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp

# copy composer from official composer image
COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV PATH "/tmp/vendor/bin:$PATH"

# Install typo3/surf
RUN composer global require typo3/surf:^2 \
    && composer clear-cache

# clean up
RUN apt-get clean

WORKDIR /app
CMD ["/bin/bash"]
