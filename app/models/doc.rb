class Doc < ActiveRecord::Base

  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :api_version
  validates_presence_of :base_path

  belongs_to :user
  has_many :resources, :dependent => :destroy, :order => "sort ASC"
  has_many :models, :dependent => :destroy

  before_create :generate_unique_subdomain

  def version
    api_version
  end

  def to_json
    { 
      :apiVersion => version,
      :swaggerVersion => "1.1",
      :basePath => "http://#{host_to_json}",
      :apis => resources.map{ |resource| { :path => "/#{resource.name}.{format}", :description => resource.description } }
    }
  end

  private

  def host_to_json
    fqdn || "#{subdomain}.#{Setting.host}"
  end

  def generate_unique_subdomain
    begin
      rand ||= SecureRandom.hex(3)
    end while !self.class.count(:conditions => ["subdomain = ?", rand]).zero?
    self.subdomain = rand
  end

end
