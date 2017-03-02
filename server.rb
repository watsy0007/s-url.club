require 'sinatra'
require 'sinatra/reloader' if development?

configure { set :server, :puma }

get '/' do
  'Hello world!'
end
