# Use the Ruby 3.1.1 image from Docker Hub as the base image
# (https://hub.docker.com/_/ruby)
FROM --platform=linux/amd64 ruby:3.1.1

# Set docker default platform to linux/amd64 (so it doesn't conflict with ARM)
ENV DOCKER_DEFAULT_PLATFORM=linux/amd64

# Update the package sources for yarn and chrome
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Update the package list 
RUN apt-get update -qq

# install chrome + yarn + psql
RUN apt-get install -y google-chrome-stable yarn postgresql-client nano

# Run yarn install to install JavaScript dependencies.
RUN yarn install --check-files

# Set up Chromedriver Environment variables
ENV CHROMEDRIVER_VERSION 99.0.4844.51
ENV CHROMEDRIVER_DIR /chromedriver
RUN mkdir $CHROMEDRIVER_DIR

# Download and install Chromedriver
RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR

# Link chromedriver to /usr/local/bin
RUN ln -s $CHROMEDRIVER_DIR/chromedriver /usr/local/bin/chromedriver

# CodeCoverage
ENV CI true
ENV CODECOV_TOKEN 7bbfe139-fc76-4ba3-9e45-1ea968722cbb
RUN curl -Os https://uploader.codecov.io/latest/linux/codecov
RUN chmod +x codecov

# Use a directory called /code in which to store this application's files. 
# (The directory name is arbitrary and could have been anything.)
WORKDIR /code

# Copy over local gemfile and lockfile
COPY Gemfile* /code

# Run bundle install to install the Ruby dependencies.
RUN bundle install

# Copy all the application's files into the /code directory.
COPY . /code

# Precomplile
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Copy entrypoint file to remove already existing server.pid file
RUN ["chmod", "+x", "/code/entrypoint.sh"]
ENTRYPOINT [ "sh", "/code/entrypoint.sh" ]

# Set "rails server -b 0.0.0.0" as the command to run when this container starts.
CMD ["rails", "server", "-b", "0.0.0.0"]
