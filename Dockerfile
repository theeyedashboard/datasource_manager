FROM ruby
RUN gem install sinatra
RUN gem install thin
RUN gem install rack-test
RUN gem install rspec
RUN mkdir /datasource_manager
WORKDIR /datasource_manager
ADD . /datasource_manager
RUN rspec
CMD ["ruby", "ds_manager.rb"]
EXPOSE 80
