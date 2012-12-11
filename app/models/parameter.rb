class Parameter < ActiveRecord::Base
  belongs_to :operation
  validates_presence_of :name
  PARAM_TYPES = [:path, :query, :body, :header]
  DATA_TYPES = [:string, :byte, :boolean, :int, :long, :float, :double, :Date, :List, :Set, :Array]
end
