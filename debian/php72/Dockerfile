FROM composer:1 AS composer

FROM debian:buster-slim

# add php package resources
RUN apt-get update \
	&& apt-get install apt-transport-https gnupg curl -y \
	&& curl https://packages.sury.org/php/apt.gpg | apt-key add - \
	&& echo 'deb https://packages.sury.org/php/ buster main' > /etc/apt/sources.list.d/php.list \
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
RUN apt-get install php7.2-cli php7.2-xml php7.2-gd php7.2-mbstring php7.2-curl php7.2-zip php7.2-mysqli php7.2-intl php7.2-imagick php7.2-sqlite php7.2-soap php7.2-xdebug -y \
	&& echo "xdebug.mode=coverage" >> /etc/php/7.2/cli/conf.d/20-xdebug.ini

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
