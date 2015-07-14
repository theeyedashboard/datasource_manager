require 'spec_helper'
require 'rspec'
require 'rack/test'
require_relative '../src/app.rb'
require_relative '../src/datasources.rb'

describe 'Datasource Manager App' do
  include Rack::Test::Methods

  context 'CRUD' do

    before(:each) do
      # Build datasources fixtures
      DataSource.create(id:           '1',
                        title:        'First datasource',
                        description:  'Description for datasource #1')
      # Build 2nd datasource as fixture
      DataSource.create(id:           '2',
                        title:        'Second datasource',
                        description:  'Description for datasource #2')
    end

    # TEST INDEX
    # --------------------------------------------------------------------------
    context 'GET /' do
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

    # TEST SHOW
    # --------------------------------------------------------------------------
    context 'GET /{DATASOURCE_ID}' do
      it "should return first datasource" do
        # get first datasource from rest
        get "/#{DataSource.first.id}"
        # check if fetched datasource is the one we want
        datasource = JSON.parse(last_response.body)
        expect(datasource['title']).to eq("First datasource")
        expect(datasource['description']).to eq("Description for datasource #1")
      end
    end

    # TEST EDIT
    # --------------------------------------------------------------------------
    context 'PUT /{DATASOURCE_ID}' do
      it "should update datasource" do
        # update first datasource's title with PUT method
        put "/#{DataSource.first.id}",
             { title: 'Another datasource'}.to_json
        # update first datasource's description with PUT method
        put "/#{DataSource.first.id}",
             { description: 'Description for another datasource'}.to_json
        # check if first datasource is updated
        expect(DataSource.first.title).to eq("Another datasource")
        expect(DataSource.first.description).to eq("Description for another datasource")
      end
    end

    # TEST CREATE
    # --------------------------------------------------------------------------
    context 'POST /' do
      it "should create a datasource" do
        # update first datasource with PUT method
        post "/",
             { title:       'New datasource',
               description: 'Description for new datasource'}.to_json
        # check if first datasource is updated
        expect(DataSource.count).to eq(3) # 2 already exist
        expect(DataSource.last.title).to eq("New datasource")
        expect(DataSource.last.description).to eq("Description for new datasource")
      end
    end

    # TEST DELETE
    # --------------------------------------------------------------------------
    context 'DELETE /{DATASOURCE_ID}' do
      it "should create a datasource" do
        # check if datasource count is normal
        expect(DataSource.count).to eq(2)
        # update first datasource with PUT method
        delete "/#{DataSource.first.id}"
        # check if datasource count decreased
        expect(DataSource.count).to eq(1)
      end
    end

  end # end CRUD

end
