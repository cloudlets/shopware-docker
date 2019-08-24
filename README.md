# shopware-webserver
Shopware-optimized Docker image

Shopware-optimized Docker image by Cloudlets.io. This image is built with CI/CD in mind and therefore provides a solid base image ready to be used in all stages your application lifecycle: from local development up to production. 

## Local development
To use this image for local development, you can start the Docker image and mount your host volume in the container at /var/www/html/shopware:

docker run --name your-name -v /your/local/directory:/var/www/html/shopware -p 8080:8080 cloudlets/shopware:latest

For local development, you will probably want to extend this image with tools to improve your development experience, like xdebug. You can do by extending the Dockerfile in this repository.

## Production
