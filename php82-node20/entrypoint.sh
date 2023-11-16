#!/bin/sh -l
echo "Run composer install"
composer install --prefer-dist --ignore-platform-reqs --no-interaction

if [ "$INPUT_USE_YARN" = "true" ]; then
	echo "Running yarn install and yarn encore install..."
	yarn install
	yarn encore production
else
	echo "Skipping yarn install and yarn encore install..."
fi

echo "Create an archive"
composer archive --file output --no-interaction

echo "Add directories needed for test to the archive"
tar -rvf output.tar ${INPUT_DIR_TO_INCLUDE}
