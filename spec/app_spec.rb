require 'spec_helper'
require 'rspec'
require 'rack/test'
require_relative '../src/app.rb'

describe 'Datasource Manager App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'when I visit /' do
    it "should return all datasources" do
      get '/'
      @expected = [{
        :id           => '1',
        :title        => 'First datasource',
        :description  => 'Description for datasource #1'
      },
      {
        :id           => '2',
        :title        => 'Second datasource',
        :description  => 'Description for datasource #2'
      }].to_json
      expect(last_response.body).to eq(@expected)
    end
  end

  context 'when I visit /datasources/1' do
    it "should return first datasource" do
      get '/datasource/1'
      @expected = {
        :id           => '1',
        :title        => 'First datasource',
        :description  => 'Description for datasource #1'
      }.to_json
      expect(last_response.body).to eq(@expected)
    end
  end
end
