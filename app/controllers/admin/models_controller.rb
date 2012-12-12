class Admin::ModelsController < Admin::BaseController
  before_filter :get_doc
  before_filter :get_model, :except => [:index]

  def index
    @models = @doc.models
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @model.save
      redirect_to admin_doc_models_path(@doc), :notice => "create success"
    else
      flash[:error] = @model.errors.full_messages
      render :new
    end
  end

  def update
    @model.send params[:sort] if params[:sort]
    if @model.update_attributes params[:model]
      redirect_to admin_doc_models_path(@doc), :notice => "update success"
    else
      flash[:error] = @model.errors.full_messages
      render :edit
    end
  end

  def destroy
    @model.destroy
    redirect_to admin_doc_models_path(@doc), :notice => "delete success"
  end

  private

  def get_doc
    @doc = current_user.docs.find(params[:doc_id])
  end
  
  def get_model
    @model = params[:id] ? @doc.models.find(params[:id]) : @doc.models.new(params[:model])
  end
end