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
  url = Url.find(uuid: params[:uuid])
  redirect(url.empty? ? '/' : url.first.url)
end

post '/api/urls' do
  url = params[:url]
  Url.create(url:url, uuid: SecureRandom.uuid.delete('-')[0..11]) unless Url.exists?(url: params[:url])
end
