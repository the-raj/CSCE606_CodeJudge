# Use the Ruby 2.7.1 image from Docker Hub
# as the base image (https://hub.docker.com/_/ruby)
FROM ruby:3.1.1

# Update the system and install yarn + psql
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn postgresql-client

# Run yarn install to install JavaScript dependencies.
RUN yarn install --check-files

# Use a directory called /code in which to store
# this application's files. (The directory name
# is arbitrary and could have been anything.)
WORKDIR /code

# Copy over local gemfile and lockfile
COPY Gemfile* /code
# Run bundle install to install the Ruby dependencies.
RUN bundle install 

# Copy all the application's files into the /code
# directory.
COPY . /code

# Precomplile
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Set "rails server -b 0.0.0.0" as the command to
# run when this container starts.
CMD ["rails", "server", "-b", "0.0.0.0"]

