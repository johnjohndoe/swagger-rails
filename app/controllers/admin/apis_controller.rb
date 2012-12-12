class Admin::ApisController < Admin::BaseController
  before_filter :clean_parameters_attributes, :only => [:update, :create]
  before_filter :get_doc
  before_filter :get_resource
  before_filter :get_api, :except => [:index]

  def index
    render "admin/resources/show"
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @api.save
      redirect_to admin_doc_resource_apis_path(@doc, @resource), :notice => "create success"
    else
      flash[:error] = @api.errors.full_messages
      render :new
    end
  end

  def update
    if @api.update_attributes params[:api]
      redirect_to admin_doc_resource_apis_path(@doc, @resource), :notice => "update success"
    else
      flash[:error] = @api.errors.full_messages
      render :edit
    end
  end

  def destroy
    @api.destroy
    redirect_to admin_doc_resource_apis_path(@doc, @resource), :notice => "delete success"
  end

  private

  def get_doc
    @doc = current_user.docs.find(params[:doc_id])
  end

  def get_resource
    @resource = @doc.resources.find params[:resource_id]
  end
  
  def get_api
    @api = params[:id] ? @resource.apis.find(params[:id]) : @resource.apis.new(params[:api])
  end

  def clean_parameters_attributes
    if params[:api][:parameters_attributes]
      params[:api][:parameters_attributes] = params[:api][:parameters_attributes].select do |k, v|
        v.delete :_destroy
        Parameter.new(v.merge(:api_id => params[:id])).valid?
      end
    end
  end

end
