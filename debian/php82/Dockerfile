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
RUN apt-get install php8.2-cli php8.2-xml php8.2-gd php8.2-mbstring php8.2-curl php8.2-zip php8.2-mysqli php8.2-intl php8.2-imagick php8.2-sqlite php8.2-soap php8.2-xdebug -y \
	&& echo "xdebug.mode=coverage" >> /etc/php/8.2/cli/conf.d/20-xdebug.ini

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
