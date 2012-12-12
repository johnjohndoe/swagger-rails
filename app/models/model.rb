class Model < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doc
  validates_uniqueness_of :name, :scope => [:doc_id]
  validates_presence_of :name
  validates_presence_of :doc_id
end
