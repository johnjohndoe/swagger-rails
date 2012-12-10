class Doc < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :api_version
  validates_presence_of :base_path

  def version
    api_version
  end
  
end
