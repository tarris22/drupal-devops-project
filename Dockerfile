FROM drupal:11-apache

RUN a2enmod rewrite headers

RUN printf '%s\n' \
    'upload_max_filesize=64M' \
    'post_max_size=64M' \
    'memory_limit=256M' \
    'max_execution_time=300' \
    > /usr/local/etc/php/conf.d/drupal-custom.ini

HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=3 \
    CMD php -r '$c=@fsockopen("127.0.0.1",80); if($c){fclose($c);exit(0);}exit(1);'
