class Admin::DocsController < Admin::BaseController
  before_filter :get_doc, :except => [:index]
  before_filter{ breadcrumb_doc(@doc) }

  def index
    @docs = current_user.docs
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @doc.save
      redirect_to admin_doc_path(@doc), :notice => "create success"
    else
      flash[:error] = @doc.errors.full_messages
      render :new
    end
  end

  def update
    if @doc.update_attributes params[:doc]
      redirect_to admin_doc_path(@doc), :notice => "update success"
    else
      flash[:error] = @doc.errors.full_messages
      render :edit
    end
  end

  def destroy
    @doc.destroy
    redirect_to admin_docs_path, :notice => "delete success"
  end

  private

  def get_doc
    @doc = params[:id] ? current_user.docs.find(params[:id]) : current_user.docs.new(params[:doc])
  end

end
