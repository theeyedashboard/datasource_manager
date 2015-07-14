require 'spec_helper'
require 'rspec'
require 'rack/test'
require File.dirname(__FILE__) + '/../ds_manager.rb'

describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    # expect(last_response.body).to eq('Hello World')
  end
end
