# Dockerfile.rails
FROM amd64/ruby:latest AS rails-toolbox

# Set the working directory in the container
WORKDIR /app


# Copy the application code into the container
COPY . ./

# Install dependencies
RUN bundle install

# Build the ruby app
RUN bundle exec rake build

# Specify the command to run on container start
CMD ["ruby", "lib/main.rb"]