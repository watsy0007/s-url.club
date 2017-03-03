FROM ruby:2.4

WORKDIR /app
ADD . /app
RUN bundler install && bundler clean --force
EXPOSE 3000
CMD ["puma", "--config", "puma.rb"]