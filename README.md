# Shopware webserver Docker image.
This image contains a Shopware-optimized Nginx + PHP-FPM configuration. Maintained by [Cloudlets.io](https://cloudlets.io). This image is built with CI/CD in mind and therefore provides a solid base image ready to be used in all stages your application lifecycle: from local development up to production. 

## Local development
To use this image for local development, you can start the Docker image and mount your host volume in the container at /var/www/html/shopware:

```$ docker run --name your-name -v /your/local/directory:/var/www/html/shopware -p 8080:8080 cloudlets/shopware:latest```
###
To enter the bash shell of the container, run the following command:
```$ docker exec -i -t  your-name /bin/bash```

To enable xdebug during development, add these lines to the development stage in your Dockerfile:
```RUN pecl install xdebug-2.6.0 && docker-php-ext-enable xdebug```

## Customizing the image
For local development, you will probably want to customize or extend this image to better fit in your devleopment proces. Below you'll find instructions for extending of customizing the Dockerfile for development purposes.

### Disabling Opcache
To disable opcache, add the following in the FROM-statement of the development stage:
> RUN
>  { \
>     echo 'opcache.enable=0'; \
> } > /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

## Production
For use in production, we recommend:
 - Extending this Dockerfile with your Shopware codebase
 - Add your own entrypoint to start your own deploy-script.
 - Deploying to a Kubernetes cluster. 

## Related / Links ##
 - Switching from classic installation to composer: https://developers.shopware.com/blog/2018/07/25/an-easy-example-how-to-switch-from-classic-installation-to-composer-installation/
 
## TO DO
- [ ] Create a multistage Dockerfile to allow for one single pre-built Dockerfile in both local development and production.
