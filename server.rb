require 'sinatra'
require 'redic'
require 'sinatra/reloader' if development?
require './url'

configure { set :server, :puma }
Ohm.redis = Redic.new(ENV['REDIS_URL'])

get '/' do
  'short urls!'
end

get '/:uuid' do
  urls = Url.find(uuid: params[:uuid])
  redirect(urls.empty? ? '/' : urls.first.url)
end

post '/api/urls' do
  urls = Url.find(url: params[:url])
  url = if urls.empty?
          Url.create(url: prams[:url], uuid: SecureRandom.uuid.delete('-')[0..11])
        else
          urls.first
        end
  "#{request.host}/#{url.uuid}"
end
