class ForeignDomain::Route
  def self.matches?(request)
    case request.host
    when nil, Setting.host, 'localhost'
      false
    else
      true
    end    
  end
end