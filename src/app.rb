require 'digest'
require 'sinatra'
require 'sinatra/reloader' # TODO: reloader for dev only
require 'socket'
require 'json'
require_relative 'datasources.rb'

set :bind, '0.0.0.0'
set :port, 80

# index
get '/' do
  @datasources = DataSource.all()
  @datasources.to_json
end

# show
get '/datasource/:id' do
  @datasource = DataSource.find(params['id'])
  @datasource.to_json
end

# update
put '/datasource/:id' do
  data = JSON.parse request.body.read
  @datasource = DataSource.find(params['id'])
  @datasource.update_attributes(data)
end

# create
post '/datasource/' do
  data = JSON.parse request.body.read
  @datasource = DataSource.create(data)
end

# destroy
delete '/datasource/:id' do
  @datasource = DataSource.find(params['id'])
  @datasource.delete
end
