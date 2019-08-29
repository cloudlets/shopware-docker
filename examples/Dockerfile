FROM cloudlets/shopware:latest

COPY install.sh /install.sh
COPY start.sh /start.sh

RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"] 
CMD ["/usr/bin/supervisord"]