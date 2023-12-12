FROM ghcr.io/openconext/openconext-basecontainers/php82-apache2-node20-composer2:latest
RUN apt-get update && \
  apt-get install -y zip
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
