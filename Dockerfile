FROM ruby:2.4

WORKDIR /app
ADD . /app
RUN bundler install
EXPOSE 4567
CMD ["ruby", "server.rb", "-p", "4567"]