class DocsController < ApplicationController
  def show
    @doc = Doc.find params[:id]
    respond_to do |f|
      f.html
      f.json { render :json => @doc.to_json }
    end
  end
end
