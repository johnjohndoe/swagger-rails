class Resource < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doc
  has_many :apis
  validates_presence_of :doc_id
end
