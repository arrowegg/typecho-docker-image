FROM ubuntu:18.04
LABEL version="0.1" author="FEI SUN" email="sunthx@outlook.com"
ENV REFRESHED_AT 2019-04-21

# modify apt source
ADD sources.list /etc/apt/

# install php7.13
RUN apt-get -yqq update && apt-get -y install software-properties-common apt-transport-https lsb-release ca-certificates
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update && apt-get -y install php7.3 php7.3-fpm php7.3-curl php7.3-mbstring php7.3-mysql

# install nginx
RUN apt-get -y install nginx

# create website dir
RUN mkdir -p /var/www/typecho

# upload website source 
ADD 1.1-17.10.30-release.tar.gz /var/www/typecho/

# add our nginx config
ADD nginx/default /etc/nginx/sites-available/default

# publish 80 port
EXPOSE 80

# command line
ENTRYPOINT [ "/usr/sbin/nginx","-g","daemon off;" ]