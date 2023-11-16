#!/bin/sh -l
DIR_TO_INCLUDE=$1
USE_YARN=$2
echo USE_YARN= $USE_YARN
echo DIR_TO_INCLUDE = $DIR_TO_INCLUDE
echo "Run composer install"
APP_ENV=test composer install --prefer-dist --ignore-platform-reqs --no-interaction

if [ "$USE_YARN" = "true" ]; then
	echo "Running yarn install and yarn encore install..."
	yarn install
	yarn encore production
else
	echo "Skipping yarn install and yarn encore install..."
fi

echo "Create an archive"
composer archive --file output --no-interaction

echo "Add directories needed for test to the archive"
tar -rvf output.tar ${DIR_TO_INCLUDE}
