require 'spec_helper'
require 'rspec'
require 'rack/test'
require_relative '../src/app.rb'
require_relative '../src/datasources.rb'

describe 'Datasource Manager App' do
  include Rack::Test::Methods

  context 'when I visit /' do

    before(:each) do
      # Build datasources fixtures
      DataSource.create(id:           '1',
                        title:        'First datasource',
                        description:  'Description for datasource #1')

      DataSource.create(id:           '2',
                        title:        'Second datasource',
                        description:  'Description for datasource #2')
    end

    # check index '/'
    it "should return all datasources" do
      get '/'
      datasources = JSON.parse(last_response.body)
      expect(datasources[0]['title']).to eq('First datasource')
    end
  end

  # context 'when I visit /datasources/1' do
  #   it "should return first datasource" do
  #     get '/datasource/1'
  #     @expected = {
  #       :id           => '1',
  #       :title        => 'First datasource',
  #       :description  => 'Description for datasource #1'
  #     }.to_json
  #     expect(last_response.body).to eq(@expected)
  #   end
  # end
end
