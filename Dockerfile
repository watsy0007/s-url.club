FROM ruby:2.4.0-alpine

WORKDIR /app
ADD . /app
RUN bundler install
CMD ["ruby", "server.rb"]