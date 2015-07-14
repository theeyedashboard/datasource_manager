FROM ruby
RUN gem install sinatra
RUN gem install thin
RUN mkdir /datasource_manager
WORKDIR /datasource_manager
ADD . /datasource_manager
CMD ["ruby", "ds_manager.rb"]
EXPOSE 80
