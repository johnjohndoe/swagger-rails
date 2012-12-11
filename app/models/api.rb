class Api < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doc
  has_many :operations
  validates_presence_of :path

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
