class Admin::OperationsController < ApplicationController
  before_filter :get_doc
  before_filter :get_api
  before_filter :get_operation, :except => [:index]

  def index
    render "admin/apis/show"
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @operation.save
      redirect_to admin_doc_api_operations_path(@doc, @api), :notice => "create success"
    else
      flash[:error] = @operation.errors.full_messages
      render :new
    end
  end

  def update
    if @operation.update_attributes params[:operation]
      redirect_to admin_doc_api_operations_path(@doc, @api), :notice => "update success"
    else
      flash[:error] = @operation.errors.full_messages
      render :edit
    end
  end

  def destroy
    @operation.destroy
    redirect_to admin_doc_api_operations_path(@doc, @api), :notice => "delete success"
  end

  private

  def get_doc
    @doc = current_user.docs.find(params[:doc_id])
  end
  
  def get_api
    @api = @doc.apis.find(params[:api_id])
  end

  def get_operation
    @operation = params[:id] ? @api.operations.find(params[:id]) : @api.operations.new(params[:operation])
  end
end
