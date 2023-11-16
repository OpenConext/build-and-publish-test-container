#!/bin/sh -l

echo "Run composer install"
APP_ENV=test composer install --prefer-dist --ignore-platform-reqs --no-interaction
echo "Run yarn install"
yarn install
yarn encore production
composer archive output --no-interaction
