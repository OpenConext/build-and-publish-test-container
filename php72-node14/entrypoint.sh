#!/bin/sh -l
. ./component_info
export APP_ENV=test
echo "Run composer install"
composer install --prefer-dist --ignore-platform-reqs --no-interaction

if [ "$INPUT_USE_YARN" = "true" ]; then
	echo "Running yarn install and yarn encore install..."
	/usr/local/bin/yarn install
	/usr/local/bin/yarn encore production
else
	echo "Skipping yarn install and yarn encore install..."
fi

echo "Create an archive"
composer archive --file output --no-interaction

echo "Add directories needed for test to the archive"
tar --posix -rvf output.tar ${TEST_EXTRA_DIRS}
