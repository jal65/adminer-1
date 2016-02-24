FROM alpine
MAINTAINER Nicolas RAMY <nicolas.ramy@darkelda.com>

RUN apk update && apk upgrade
RUN apk add php php-pdo_mysql php-pdo_pgsql php-mysqli php-mcrypt php-mysql php-pgsql

# install adminer and default theme
RUN mkdir /var/www
ADD https://www.adminer.org/latest.php /var/www/index.php
ADD https://raw.githubusercontent.com/vrana/adminer/master/designs/pepa-linha/adminer.css /var/www/adminer.css
WORKDIR /var/www

EXPOSE 8000
CMD ["php", "-S", "0.0.0.0:8000", "-t", "/var/www"]
