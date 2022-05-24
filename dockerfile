# 1 Set master image
FROM ubuntu/apache2:2.4-22.04_beta

RUN DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt update && \
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
        php5.6-opcache \
        php5.6-readline \
        php5.6-xml \
        libapache2-mod-php5.6 && \
    rm -rf /var/lib/apt/lists/* && \
    a2enmod php5.6 && \
    a2enmod rewrite

EXPOSE 80

# 7 Add UID '1000' to www-data
# RUN usermod -u 1000 www-data

# # 8 Copy existing application directory permissions
# COPY --chown=www-data:www-data . /var/www/html

# # 9 Change current user to www
# USER www-data

# 10 Expose port 9000 and start php-fpm server
# EXPOSE 9000
# CMD ["php-fpm"]
