require 'spec_helper'
require 'rspec'
require 'rack/test'
require File.dirname(__FILE__) + '/../app.rb'

describe 'Datasource Manager App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'when I visit /' do
    it "should respond ok" do
      get '/'
      @expected = [{
        :title        => 'First datasource',
        :description  => 'Description for datasource #1'
      }].to_json
      expect(last_response.body).to eq(@expected)
    end
  end
end
