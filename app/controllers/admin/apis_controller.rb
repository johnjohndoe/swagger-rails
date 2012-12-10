class Admin::ApisController < Admin::BaseController
  before_filter :get_doc
  before_filter :get_api, :except => [:index]

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
    if @api.save
      redirect_to admin_doc_apis_path(@doc), :notice => "create success"
    else
      flash[:error] = @api.errors.full_messages
      render :new
    end
  end

  def update
    if @api.update_attributes params[:api]
      redirect_to admin_doc_apis_path(@doc), :notice => "update success"
    else
      flash[:error] = @api.errors.full_messages
      render :edit
    end
  end

  def destroy
    @api.destroy
    redirect_to admin_doc_apis_path(@doc), :notice => "delete success"
  end

  private

  def get_doc
    @doc = current_user.docs.find(params[:doc_id])
  end
  
  def get_api
    @api = params[:id] ? @doc.apis.find(params[:id]) : @doc.apis.new(params[:api])
  end
end
