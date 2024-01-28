FROM ruby:3.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1



# Set the working directory in the container
WORKDIR /app


COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .


# Specify the command to run on container start
CMD ["./lib/main.rb"]