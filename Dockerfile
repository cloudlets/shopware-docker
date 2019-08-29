FROM cloudlets/shopware:latest

# If you want to extend this image, please do so before the CMD-statement. For examples, please 
# refer to the README file or the examples-directory at https://github.com/cloudlets/shopware-webserver

CMD ["/usr/bin/supervisord"]