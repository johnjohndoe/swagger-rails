class Operation < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :api
  validates_presence_of :api_id
  validates_presence_of :http_method
  HTTP_METHODS = [:GET, :POST, :PUT, :DELETE]
end
