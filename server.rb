require 'sinatra'
require 'redic'
require 'sinatra/reloader' if development?
require './url'

configure { set :server, :puma }
Ohm.redis = Redic.new(ENV['REDIS_URL'])

get '/' do
  'curl -X POST -F "url=http://google.com" "http://s-url.club/api/urls"'
end

get '/:uuid' do
  urls = Url.find(uuid: params[:uuid])
  redirect(urls.empty? ? '/' : urls.first.url)
end

post '/api/urls' do
  urls = Url.find(url: params[:url])
  url = if urls.empty?
          Url.create(url: params[:url], uuid: SecureRandom.uuid.delete('-')[0..11])
        else
          urls.first
        end
  "http://#{request.host}/#{url.uuid}"
end
