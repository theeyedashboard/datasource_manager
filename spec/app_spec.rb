require 'spec_helper'
require 'rspec'
require 'rack/test'
require_relative '../src/app.rb'
require_relative '../src/datasources.rb'

describe 'Datasource Manager App' do
  include Rack::Test::Methods

  # INDEX TEST

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
      # check first datasource
      expect(datasources[0]['title']).to eq('First datasource')
      expect(datasources[0]['description']).to eq('Description for datasource #1')
      # check second datasource
      expect(datasources[1]['title']).to eq('Second datasource')
      expect(datasources[1]['description']).to eq('Description for datasource #2')
    end
  end

  # SHOW TEST

  context 'when I visit /datasources/1' do

    before(:each) do
      # Build datasources fixtures
      DataSource.create(title:        'First datasource',
                        description:  'Description for datasource #1')

      DataSource.create(title:        'Second datasource',
                        description:  'Description for datasource #2')
      @first_datasource = DataSource.first
    end

    it "should return first datasource" do
      # get first datasource from rest
      get "/datasource/#{@first_datasource.id}"
      # check if fetched datasource is the one we want
      datasource = JSON.parse(last_response.body)
      expect(datasource['title']).to eq("First datasource")
      expect(datasource['description']).to eq("Description for datasource #1")
    end
  end

  # EDIT TEST

  context 'when I update /datasources/1' do

    before(:each) do
      # Build datasources fixtures
      DataSource.create(title:        'First datasource',
                        description:  'Description for datasource #1')

      DataSource.create(title:        'Second datasource',
                        description:  'Description for datasource #2')
      @first_datasource = DataSource.first
    end

    it "should update datasource" do

      # update first datasource with PUT method
      put "/datasource/#{@first_datasource.id}",
           { title: 'Another datasource'}.to_json

      put "/datasource/#{@first_datasource.id}",
           { description: 'Description for another datasource'}.to_json

      # check if first datasource is updated
      expect(DataSource.first.title).to eq("Another datasource")
      expect(DataSource.first.description).to eq("Description for another datasource")
    end
  end

  # CREATE TEST

  context 'when I POST /datasource' do

    it "should create a datasource" do

      # update first datasource with PUT method
      post "/datasource/",
           { title:       'New datasource',
             description: 'Description for new datasource'}.to_json

      # check if first datasource is updated
      expect(DataSource.count).to eq(1)
      expect(DataSource.first.title).to eq("New datasource")
      expect(DataSource.first.description).to eq("Description for new datasource")
    end
  end

  # DELETE TEST
  context 'when I POST /datasource' do

    before(:each) do
      # Build datasources fixtures
      DataSource.create(title:        'First datasource',
                        description:  'Description for datasource #1')

      DataSource.create(title:        'Second datasource',
                        description:  'Description for datasource #2')
      @first_datasource = DataSource.first
    end

    it "should create a datasource" do

      # check if datasource count is normal
      expect(DataSource.count).to eq(2)

      # update first datasource with PUT method
      delete "/datasource/#{@first_datasource.id}"

      # check if datasource count decreased
      expect(DataSource.count).to eq(1)
    end
  end

end
