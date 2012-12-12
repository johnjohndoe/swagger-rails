module AdminHelper
  def resource_button_urls(resource)
    doc = resource.doc
    { :up => admin_doc_resource_path(doc, resource, :sort => :move_higher),
      :down => admin_doc_resource_path(doc, resource, :sort => :move_lower),
    }
  end

  def api_button_urls(api)
    resource = api.resource
    doc = resource.doc
    { :up => admin_doc_resource_api_path(doc, resource, api, :sort => :move_higher),
      :down => admin_doc_resource_api_path(doc, resource, api, :sort => :move_lower),
    }
  end
end
