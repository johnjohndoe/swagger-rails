class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!

  private

  def authenticate_and_find_doc!
    if doc_id = (params[:controller] == "admin/docs" ? params[:id] : params[:doc_id])
      @doc = current_user.docs.find(doc_id) rescue current_user.cooperated_docs.find(doc_id)
    end
  end
end
