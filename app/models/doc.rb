class Doc < ActiveRecord::Base

  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :api_version
  validates_presence_of :base_path

  belongs_to :user
  has_many :apis, :dependent => :destroy
  has_many :resources, :dependent => :destroy, :order => "sort ASC"

  def version
    api_version
  end

  def to_json
    { 
      :apiVersion => version,
      :swaggerVersion => "1.1",
      :basePath => base_path,
      :apis => apis.map{ |api| { :path => "/docs/#{id}/apis#{api.path}", :description => api.description } },
      :models => []
    }
  end

end
