class Parameter < ActiveRecord::Base
  belongs_to :api
  validates_presence_of :name
  PARAM_TYPES = [:path, :query, :body, :header]
  DATA_TYPES = [:string, :byte, :boolean, :int, :long, :float, :double, :Date, :List, :Set, :Array]

  def to_json
    {
      :paramType => param_type,
      :name => name,
      :description => description,
      :dataType => data_type,
      :required => required,
      :allowMultiple => allow_multiple
    }
  end
end
