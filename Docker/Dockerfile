# official Gatus image
FROM twinproduction/gatus:latest

# Copy config file into the container
COPY config.yaml /config/config.yaml

# Expose default Gatus port
EXPOSE 8080


CMD ["--config-file", "/config/config.yaml"]

