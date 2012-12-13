module AdminHelper
  def resource_button_urls(resource)
    doc = resource.doc
    { :up => admin_doc_resource_path(doc, resource, :sort => :move_higher, :redirect_to => url_for(params)),
      :down => admin_doc_resource_path(doc, resource, :sort => :move_lower, :redirect_to => url_for(params)),
    }
  end

  def api_button_urls(api)
    resource = api.resource
    doc = resource.doc
    { :up => admin_doc_resource_api_path(doc, resource, api, :sort => :move_higher, :redirect_to => url_for(params)),
      :down => admin_doc_resource_api_path(doc, resource, api, :sort => :move_lower, :redirect_to => url_for(params)),
    }
  end

  def render_data_type_form(form, doc)
    content_tag :span do 
      strs = []
      strs << content_tag(:select, :class => "input-small", :data => { :type => "selector" }) do
        collections = Parameter::DATA_TYPES + doc.models.map{ |model| model.name }
        options_for_select(collections, :selected => form.object.data_type)
      end
      strs << form.input_field(:data_type, :class => "input-small", :as => :string, :data => { :type => "data-types-select"}, :placeholder => "data type")
      raw strs.join("")
    end
  end

  def link_to_create(name, url)
    link_to name, url, :class => "btn btn-primary"
  end

  def link_to_more_resources(doc, limit)
    link_to admin_doc_resources_path(doc) if doc.resources.size > limit
  end

  def link_to_more_models(doc, limit)
    link_to admin_doc_models_path(doc) if doc.models.size > limit
  end
end
