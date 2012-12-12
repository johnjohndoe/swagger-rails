class Admin::ApisController < Admin::BaseController
  before_filter :clean_nested_attributes, :only => [:update, :create]
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
    @api.send params[:sort] if params[:sort]
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

  def clean_nested_attributes
    return unless params[:api]
    { :parameters => :name, :error_responses => :code }.each do |nested_name, check_field|
      key = "#{nested_name}_attributes"
      next unless params[:api][key]
      params[:api][key] = params[:api][key].select do |k, values|
        values[check_field].present?
      end
    end
  end

end
