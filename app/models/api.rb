class Api < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :resource
  has_many :parameters
  accepts_nested_attributes_for :parameters, :allow_destroy => true
  validates_presence_of :path
  validates_presence_of :resource_id
  validates_presence_of :http_method
  HTTP_METHODS = [:GET, :POST, :PUT, :DELETE]

  def full_path
    "#{doc.base_path}#{path}"
  end

  def to_json
    { 
      :apiVersion => doc.version,
      :base_path => doc.base_path,
      :swaggerVersion => "1.1",
      :resourcePath => path,
      :apis => [
        { :path => path,
          :description => description,
          :operations => operations.map{ |operation| operation.to_json }
        }
      ]
    }
  end
end
