#!/bin/bash
RMDIR="lost+found"
DIR="/var/www/html/shopware"
# init
# look for lost+found
if [ -d "$RMDIR" ]; then rm -Rf $RMDIR; fi

# look for empty dir
if [ "$(ls -A $DIR)" ]; then
     echo "warning: /var/www/html/shopware not empty. Did you accidentally mount a populated volume to /var/www/html?"
else
    # Create empty .env-file, will be populated by app/bin/functions.sh .
    touch /var/www/html/shopware/.env

fi
exec "$@"
