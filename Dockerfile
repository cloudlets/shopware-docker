FROM cloudlets/shopware:latest as development

# If you want to extend this image, please do so before the CMD-statement. For examples, please 
# refer to the README file or the examples-directory at https://github.com/cloudlets/shopware-webserver

# To disable opcache in your development stage, uncomment the following lines:
# RUN {
# echo 'opcache.enable=0';
# } > /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

CMD ["/usr/bin/supervisord"]

FROM cloudlets/shopware:latest as production

# If you want to extend this image, please do so before the CMD-statement. For examples, please 
# refer to the README file or the examples-directory at https://github.com/cloudlets/shopware-webserver

CMD ["/usr/bin/supervisord"]
