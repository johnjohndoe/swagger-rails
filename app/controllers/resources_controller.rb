class ResourcesController < ApplicationController
  def show
    @doc = Doc.find params[:doc_id]
    @resource = @doc.resources.find_by_name params[:id]
    respond_to do |f|
      f.html { render :json => @resource.to_json }
      f.json { render :json => @resource.to_json }
    end

  end
end
