FROM ghcr.io/openconext/openconext-basecontainers/php82-apache2-node20-composer2:latest
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
