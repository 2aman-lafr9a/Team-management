# Dockerfile.rails
FROM ruby:3.3.0 AS rails-toolbox

# Set the working directory in the container
WORKDIR /app


# Copy the application code into the container
COPY . .

# Install dependencies
RUN bundle install



# Specify the command to run on container start
CMD ["ruby", "lib/main.rs"]