#!/bin/sh -l

echo "Run composer install"
APP_ENV=test composer install --prefer-dist --ignore-platform-reqs --no-interaction
echo "Run yarn install"
yarn install
yarn encore production
echo "Create an archive"
composer archive --file output --no-interaction
echo "Add directories needed for test to the archive"
tar -rvf output.tar dev/
