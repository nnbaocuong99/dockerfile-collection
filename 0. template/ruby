FROM ruby:3.0-slim-buster AS builder
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

FROM ruby:3.0-slim-buster
RUN apt-get update -qq && apt-get install -y libpq-dev nodejs && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . .
RUN adduser --disabled-password --gecos '' railsuser
USER railsuser
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]