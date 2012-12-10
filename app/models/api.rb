class Api < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doc
  validates_presence_of :path

  def full_path
    "#{doc.base_path}#{path}"
  end
end
