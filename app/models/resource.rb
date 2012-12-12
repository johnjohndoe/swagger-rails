class Resource < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doc
  has_many :apis, :order => "sort ASC"
  validates_presence_of :doc_id
  validates_uniqueness_of :name, :scope => [:doc_id]
  include ActsAsSortable

  def to_json
    {
      :apiVersion => doc.version,
      :base_path => doc.base_path,
      :swaggerVersion => "1.1",
      :apis => apis.map{ |api| api.to_json }
    }
  end

end
