# -*- encoding : utf-8 -*-
class Setting < Settingslogic
  source "#{Rails.root}/config/config.yml"
  namespace Rails.env

  def host
    domain.gsub("http://", "")
  end
  
end
