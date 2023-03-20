FROM centos:7
WORKDIR /apps/srv/instance
ADD ./index.php /apps/srv/instance
ADD ./phpinfo.php /apps/srv/instance
RUN  mkdir -p /run/php-fpm && rpm -Uvh  http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && yum -y install nginx && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && yum -y install yum-utils && yum-config-manager --enable remi-php72 && yum -y install php php-cli php-common php-gd php-json php-ldap php-mbstring php-mysqlnd php-pdo php-xml php-devel php-embedded php-mcrytp php-pecl-mongodb php-pecl-redis php-pecl-memcached php-opcache php-fpm php-bcmath && yum -y install zip unzip 
COPY ./nginx.conf /etc/nginx/conf.d/my.conf
CMD /usr/sbin/php-fpm && /usr/sbin/nginx -g "daemon off;"
EXPOSE 80
EXPOSE 8080