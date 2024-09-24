# Ruby on Rails Dockerfile Template

# Base image options (uncomment one)
FROM ruby:3.0-alpine
# FROM ruby:3.0-slim
# FROM ruby:3.0

# Set environment variables
ENV RAILS_ENV=production
ENV BUNDLE_WITHOUT=development:test
ENV RAILS_SERVE_STATIC_FILES=true

# Install system dependencies
RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    tzdata \
    nodejs \
    yarn

# Set work directory
WORKDIR /app

# Install Ruby dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5

# Install JavaScript dependencies
COPY package.json yarn.lock ./
RUN yarn install --check-files

# Copy the rest of the application code
COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expose port
EXPOSE 3000

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/storage"]

# Optional: Use a non-root user
# RUN adduser -D myuser
# USER myuser
