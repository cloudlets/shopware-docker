# Shopware webserver Docker image.
This image contains a Shopware-optimized Nginx + PHP-FPM configuration. Maintained by [Cloudlets.io](https://cloudlets.io). This image is built with CI/CD in mind and therefore provides a solid base image ready to be used in all stages your application lifecycle: from local development up to production. 

## Local development
To use this image for local development, you can start the Docker image and mount your host volume in the container at /var/www/html/shopware:

```$ docker run --name your-name -v /your/local/directory:/var/www/html/shopware -p 8080:8080 cloudlets/shopware:latest```

To enter the bash shell of the container, run the following command:
```$ docker exec -i -t  your-name /bin/bash```

For local development, you will probably want to extend this image with tools to improve your development experience, like xdebug. You can do by extending the Dockerfile in this repository.

## Production

## Related / Links ##
 - Switching from classic installation to composer: https://developers.shopware.com/blog/2018/07/25/an-easy-example-how-to-switch-from-classic-installation-to-composer-installation/
 
## TO DO
- [ ] Create a multistage Dockerfile to allow for one single pre-built Dockerfile in both local development and production.
