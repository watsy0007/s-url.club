require 'sinatra'

configure {
  set :server, :puma
}
class App < Sinatra::Base
  get '/' do
    'Hello world!'
  end

  run! if app_file == $0
end
