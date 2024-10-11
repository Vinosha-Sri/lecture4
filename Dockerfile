FROM ubuntu:22.04

# Avoid prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache 
RUN apt-get update && apt-get -y install apache2

# Add your own content to the default webpage (index.html)
RUN echo 'INFR2670 webpage in a container!' > /var/www/html/index.html

# Apache configuration
RUN echo '. /etc/apache2/envvars' > /root/runapache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/runapache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/runapache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/runapache.sh && \ 
 chmod 755 /root/runapache.sh

EXPOSE 80

CMD /root/runapache.sh
