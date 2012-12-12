class Resource < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doc
end
