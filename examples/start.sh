#!/bin/bash
RMDIR="lost+found"
DIR="/var/www/html/shopware"
# init
# look for lost+found
if [ -d "$RMDIR" ]; then rm -Rf $RMDIR; fi

# look for empty dir 
if [ "$(ls -A $DIR)" ]; then
     echo "/var/www/html/shopware not empty"
else
    # Install shopware
    export COMPOSER_HOME=/var/www/html/.composer
    git clone https://github.com/shopware/composer-project.git /var/www/html/shopware
    cd /var/www/html/shopware
    rm app/bin/install.sh
    cp /install.sh app/bin/

    # Create .env file
    echo -e 'DATABASE_URL='"$DATABASE_URL"'\n'\
'SHOPWARE_ENV='"$SHOPWARE_ENV"'\n'\
'TRUSTEDPROXIES='"$TRUSTEDPROXIES"'\n'\
'ADMIN_EMAIL='"$ADMIN_EMAIL"'\n'\
'ADMIN_NAME='"$ADMIN_NAME"'\n'\
'ADMIN_USERNAME='"$ADMIN_USERNAME"'\n'\
'ADMIN_PASSWORD='"$ADMIN_PASSWORD"'\n'\
'SHOP_URL='"$SHOP_URL"'\n'\
'IMPORT_DEMODATA='"$IMPORT_DEMODATA"'\n'\
'INSTALL_IMAGES='"$INSTALL_IMAGES"'\n'
    > .env
    /usr/local/bin/composer create-project --no-scripts --no-interaction --stability=dev
    bash /var/www/html/shopware/app/bin/install.sh

    chown -Rf www-data:www-data /var/www/html
    echo -e "\n\nDone installing shopware!\n"
fi
exec "$@"
