class Doc < ActiveRecord::Base

  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :api_version
  validates_presence_of :base_path

  belongs_to :user
  has_many :resources, :dependent => :destroy, :order => "sort ASC"
  has_many :models, :dependent => :destroy

  def version
    api_version
  end

  def to_json
    { 
      :apiVersion => version,
      :swaggerVersion => "1.1",
      :basePath => base_path,
      :apis => resources.map{ |resource| { :path => "/docs/#{id}/resources/#{resource.name}.{format}", :description => resource.description } }
    }
  end

end
