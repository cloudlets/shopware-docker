FROM cloudlets/shopware:latest as production

# If you want to extend this image, please do so before the CMD-statement. For examples, please 
# refer to the README file or the examples-directory at https://github.com/cloudlets/shopware-webserver

# Copy your Shopware codebase to /var/www/html/shopware. Below, we assume your Shopware codebase is located in the shopware/ folder 
# of the repository that also keeps this Dockerfile.
COPY ./shopware /var/www/html/shopware

# Your entrypoint will be executed everytime your container start. 
ENTRYPOINT ["/start.sh"] 

# Our cloudlets/shopware baseimage uses supervisor to start nginx and php-fpm.
CMD ["/usr/bin/supervisord"]
