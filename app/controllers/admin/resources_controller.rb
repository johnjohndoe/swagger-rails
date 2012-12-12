class Admin::ResourcesController < Admin::BaseController
  before_filter :get_doc
  before_filter :get_resource, :except => [:index]

  def index
    render "admin/docs/show"
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @resource.save
      redirect_to admin_doc_resources_path(@doc), :notice => "create success"
    else
      flash[:error] = @resource.errors.full_messages
      render :new
    end
  end

  def update
    @resource.send params[:sort] if params[:sort]
    if @resource.update_attributes params[:resource]
      redirect_to admin_doc_resources_path(@doc), :notice => "update success"
    else
      flash[:error] = @resource.errors.full_messages
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to admin_doc_resources_path(@doc), :notice => "delete success"
  end

  private

  def get_doc
    @doc = current_user.docs.find(params[:doc_id])
  end
  
  def get_resource
    @resource = params[:id] ? @doc.resources.find(params[:id]) : @doc.resources.new(params[:resource])
  end
end
