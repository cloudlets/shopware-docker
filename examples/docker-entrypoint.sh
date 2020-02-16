#!/bin/bash

# Create empty .env-file if it doesn't exist yet. Will be populated by app/bin/functions.sh, which will be invoked by our entrypoint.
touch /var/www/html/shopware/.env

./app/bin/post-install.sh

exec "$@"
