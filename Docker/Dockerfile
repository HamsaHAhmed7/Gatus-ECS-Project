# Start from official Gatus image
FROM twinproduction/gatus:latest

# Copy your config file into the container
COPY config.yaml /config/config.yaml

# Expose default Gatus port
EXPOSE 8080

# Set config path (optional because we pass it in CMD)
CMD ["gatus", "-c", "/config/config.yaml"]
