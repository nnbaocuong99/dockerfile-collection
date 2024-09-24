FROM mongo:latest

# Create a non-root user for MongoDB
RUN groupadd -r mongodb && useradd -r -g mongodb mongodb

# Set up the data directory with proper permissions
RUN mkdir -p /data/db && chown -R mongodb:mongodb /data/db

# Copy custom configuration file
COPY mongod.conf /etc/mongod.conf

EXPOSE 27017

# Switch to the mongodb user
USER mongodb

CMD ["mongod", "--config", "/etc/mongod.conf"]