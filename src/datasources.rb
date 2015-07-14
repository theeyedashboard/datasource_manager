require 'mongoid'
Mongoid.load!("mongoid.yml")

class DataSource

  include Mongoid::Document
  field :title,       type: String
  field :description, type: String

end
