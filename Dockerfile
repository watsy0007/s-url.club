FROM ruby:2.4

WORKDIR /app
ADD . /app
RUN bundler install
CMD ["ruby", "server.rb"]