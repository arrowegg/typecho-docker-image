FROM ubuntu:18.04
LABEL version="0.1" author="FEI SUN" email="sunthx@outlook.com"
ENV REFRESHED_AT 2019-04-21

ADD sources.list /etc/apt/

RUN apt-get -yqq update && apt-get -y install software-properties-common apt-transport-https lsb-release ca-certificates
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update && apt-get -y install php7.3 php7.3-fpm php7.3-curl php7.3-mbstring php7.3-mysql

RUN apt-get -y install nginx

RUN mkdir -p /var/www/typecho

ADD build.tar.gz /var/www/typecho/

ADD nginx/default /etc/nginx/sites-available/default

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/nginx","-g","daemon off;" ]
