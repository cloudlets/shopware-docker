FROM cloudlets/shopware:latest 

# Our cloudlets/shopware baseimage uses supervisor to start nginx and php-fpm.
CMD ["/usr/bin/supervisord"]
