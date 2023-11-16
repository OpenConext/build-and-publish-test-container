ARG INPUT_PHP_VERSION
ARG INPUT_NODE_VERSION
FROM ghcr.io/openconext/openconext-basecontainers/${INPUT_PHP_VERSION}-apache2-${INPUT_NODE_VERSION}-composer2:latest
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
