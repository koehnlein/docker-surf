#!/bin/bash

# some commands must be executable
surf --version     || exit 1
composer --version || exit 1
yarn --version     || exit 1

# some PHP extensions must be loaded
echo 'search gd'     && php -i | grep '^gd$'     || exit 1
echo 'search mysqli' && php -i | grep '^mysqli$' || exit 1
echo 'search xdebug' && php -i | grep '^xdebug$' || exit 1
echo 'search intl'   && php -i | grep '^intl$'   || exit 1
echo 'search imagick' && php -i | grep '^imagick$' || exit 1
echo 'search pdo_sqlite' && php -i | grep '^pdo_sqlite$' || exit 1
