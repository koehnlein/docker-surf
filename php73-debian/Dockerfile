FROM composer:1 AS composer

FROM debian:jessie-slim

RUN apt-get update \
	&& apt-get install apt-transport-https gnupg curl -y \
	&& curl https://packages.sury.org/php/apt.gpg | apt-key add - \
	&& echo 'deb https://packages.sury.org/php/ jessie all' > /etc/apt/sources.list.d/php.list \
	&& apt-get update

CMD ["/bin/bash"]