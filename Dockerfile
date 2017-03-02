FROM ruby:2.4

WORKDIR /app
ADD . /app
RUN bundler install
EXPOSE 3000
CMD ["puma", "--config", "puma.rb"]