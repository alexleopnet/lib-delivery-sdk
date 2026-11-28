ARG PHP_VER
FROM php:${PHP_VER}-fpm

RUN groupmod -g 1000 www-data && usermod -u 1000 -g 1000 www-data

RUN pecl install pcov \
    && docker-php-ext-enable pcov

ADD https://github.com/mlocati/docker-php-extension-installer/releases/download/2.1.2/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions
RUN if grep -q bullseye /etc/os-release; then \
        echo 'deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20260830T000000Z bullseye-security main' \
            > /etc/apt/sources.list.d/bullseye-security-snapshot.list \
        && apt-get -o Acquire::Check-Valid-Until=false update \
        && apt-get install -y --no-install-recommends unzip \
        && rm -rf /var/lib/apt/lists/*; \
    fi
RUN install-php-extensions \
	  @composer

RUN echo "\n[PHP]" >> /usr/local/etc/php/conf.d/docker-fpm.ini  \
  && echo "error_reporting=E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED" >> /usr/local/etc/php/conf.d/docker-fpm.ini \
  && echo "memory_limit=512M" >> /usr/local/etc/php/conf.d/docker-fpm.ini \
  && echo "upload_max_filesize=16M" >> /usr/local/etc/php/conf.d/docker-fpm.ini \
  && echo "max_post_size=16M" >> /usr/local/etc/php/conf.d/docker-fpm.ini

USER 1000
WORKDIR /var/www