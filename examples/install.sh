#!/usr/bin/env bash

source $(dirname "$0")/functions.sh
banner

loadEnvFile

swCommand sw:database:setup --steps=drop,create,import
swCommand sw:database:setup --steps=importDemodata
createSymLinks

swCommand sw:database:setup --steps=setupShop --shop-url="$SHOP_URL"
swCommand sw:snippets:to:db --include-plugins
swCommand sw:theme:initialize
swCommand sw:firstrunwizard:disable
swCommand sw:plugin:deactivate SwagUpdate
swCommand sw:admin:create --name="$ADMIN_NAME" --email="$ADMIN_EMAIL" --username="$ADMIN_USERNAME" --password="$ADMIN_PASSWORD" -n

echo -e "\nInstallation finished, have fun!\n"
