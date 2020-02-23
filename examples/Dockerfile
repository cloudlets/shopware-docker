FROM cloudlets/shopware:latest as builder

# If you want to extend this image, please do so before the CMD-statement. For examples, please 
# refer to the README file or the examples-directory at https://github.com/cloudlets/shopware-webserver

# Set working directory to /var/www/html/shopware
WORKDIR /var/www/html/shopware

# Copy your Shopware codebase to /var/www/html/shopware. Below, we assume your Shopware codebase is located in the shopware/ folder 
# of the repository that also keeps this Dockerfile.
COPY --chown=www-data:www-data ./shopware /var/www/html/shopware 
COPY --chown=www-data:www-data docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh

# Install composer dependencies
RUN composer install --no-dev --prefer-dist --no-scripts 

# Post-install.sh will be our entrypoint. This entrypoint will be executed everytime the container starts. 

USER www-data
ENTRYPOINT ["/docker-entrypoint.sh"] 

USER root
# Our cloudlets/shopware baseimage uses supervisor to start nginx and php-fpm.
CMD ["/usr/bin/supervisord"]
