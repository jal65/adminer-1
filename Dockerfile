FROM alpine
MAINTAINER Nicolas RAMY <nicolas.ramy@darkelda.com>

RUN apk update && apk upgrade
RUN apk add php5 php5-pdo_mysql php5-pdo_pgsql php5-mysqli php5-mcrypt php5-mysql php5-pgsql

# install adminer and default theme
RUN mkdir /var/www
ADD https://www.adminer.org/latest.php /var/www/index.php
ADD https://raw.githubusercontent.com/vrana/adminer/master/designs/pepa-linha/adminer.css /var/www/adminer.css
WORKDIR /var/www

EXPOSE 8000
CMD ["php", "-S", "0.0.0.0:8000", "-t", "/var/www"]
