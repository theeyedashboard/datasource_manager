require 'digest'
require 'sinatra'
require 'sinatra/reloader' # TODO: reloader for dev only
require 'socket'
require 'json'
require_relative 'datasources.rb'

set :bind, '0.0.0.0'
set :port, 80

get '/' do
  @datasources = DataSource.all()
  @datasources.to_json
end

get '/datasource/:id' do
  @datasource = DataSource.find(params['id'])
  @datasource.to_json
end
