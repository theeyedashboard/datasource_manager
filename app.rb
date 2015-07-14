require 'digest'
require 'sinatra'
require 'sinatra/reloader' # TODO: reloader for dev only
require 'socket'
require 'json'

set :bind, '0.0.0.0'
set :port, 80

get '/' do
  datasource = [{
    :title       => 'First datasource',
    :description => 'Description for datasource #1'
  }]
  datasource.to_json
end
