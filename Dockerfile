FROM ruby:3.1.0-alpine
#RUN apt-get update -qq && apt-get install -y build-essential tzdata nodejs ruby-dev mysql-client
RUN apk add --no-cache \
    bash \
    build-base \
    tzdata \
    git \
    mariadb-dev \
    libc6-compat\
    less\
    mysql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY . ./
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
# CMD ["rails", "server", "-b", "0.0.0.0"]