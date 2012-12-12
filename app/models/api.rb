class Api < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :resource
  has_many :parameters, :dependent => :destroy
  accepts_nested_attributes_for :parameters, :allow_destroy => true
  validates_presence_of :path
  validates_presence_of :resource_id
  validates_presence_of :doc_id
  validates_presence_of :http_method
  validates_uniqueness_of :path, :scope => [:doc_id, :http_method]
  HTTP_METHODS = [:GET, :POST, :PUT, :DELETE]

  before_validation :sync_doc_id

  def full_path
    "#{doc.base_path}#{path}"
  end

  def to_json
    { 
      :path => path,
      :description => resource.description,
      :operations => [{
        :httpMethod => http_method,
        :nickname => nickname,
        :responseClass => response_class,
        :summary => summary,
        :notes => note,
        :parameters => parameters.map{ |parameter| parameter.to_json },
        :errorResponses => []
      }]
    }
  end

  private 

  def sync_doc_id
    self.doc_id = resource.doc_id unless doc_id
  end

end
