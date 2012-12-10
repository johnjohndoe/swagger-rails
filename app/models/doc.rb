class Doc < ActiveRecord::Base

  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :api_version
  validates_presence_of :base_path

  belongs_to :user
  has_many :apis, :dependent => :destroy

  def version
    api_version
  end
  
end
