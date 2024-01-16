# Via https://hub.docker.com/r/ubuntu/apache2/tags
FROM ubuntu/apache2:2.4-22.04_beta
# as of 2024-01-15 this was the latest version to have php5.6 backport support from the ppa below

RUN DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt update && \
    apt upgrade -y && \
    apt install -y \
        php-common \
        php5.6 \
        php5.6-cgi \
        php5.6-cli \
        php5.6-common \
        php5.6-curl \
        php5.6-json \
        php5.6-mbstring \
        php5.6-mcrypt \
        php5.6-mysql \
        php5.6-pgsql \
        php5.6-opcache \
        php5.6-readline \
        php5.6-xml \
        libapache2-mod-php5.6 && \
    rm -rf /var/lib/apt/lists/* && \
    a2enmod php5.6 && \
    a2enmod rewrite && \
    sed -i 's/memory_limit = 128M/memory_limit = 256M/g' /etc/php/5.6/apache2/php.ini

EXPOSE 80
