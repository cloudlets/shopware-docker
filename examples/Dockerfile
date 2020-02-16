FROM cloudlets/shopware:latest as builder

# If you want to extend this image, please do so before the CMD-statement. For examples, please 
# refer to the README file or the examples-directory at https://github.com/cloudlets/shopware-webserver

# Set working directory to /var/www/html/shopware
WORKDIR /var/www/html/shopware

# Copy your Shopware codebase to /var/www/html/shopware. Below, we assume your Shopware codebase is located in the shopware/ folder 
# of the repository that also keeps this Dockerfile.
COPY ./shopware /var/www/html/shopware 
COPY docker-entrypoint.sh .
RUN chmod a+x docker-entrypoint.sh

# Enable parallel composer package installations
RUN composer global require hirak/prestissimo

# Install composer dependencies
RUN composer install --no-dev --prefer-dist --no-scripts 

# Create empty .env-file if it doesn't exist yet. Will be populated by app/bin/functions.sh, which will be invoked by our entrypoint.
RUN touch /var/www/html/shopware/.env

# Post-install.sh will be our entrypoint. This entrypoint will be executed everytime the container starts. 
ENTRYPOINT ["./docker-entrypoint.sh"] 

FROM cloudlets/shopware:latest as production

COPY --chown=www-data:www-data --from=builder /var/www/html/shopware /var/www/html/shopware 

# Our cloudlets/shopware baseimage uses supervisor to start nginx and php-fpm.
CMD ["/usr/bin/supervisord"]
