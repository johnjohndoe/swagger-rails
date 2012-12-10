class Api < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doc
  has_many :operations
  validates_presence_of :path

  def full_path
    "#{doc.base_path}#{path}"
  end
end
