class RequestsController < ApplicationController
  def index
    @requests = policy_scope(Request)
    @requests = current_user.requests
  end

  def new
    @request = policy_scope(Request)
  end

  def create
    @request = Request.new(request_params)
    @request.creator_id = current_user.id
    authorize @request
    if @request.save
      redirect_to categories_path
    else
      redirect_to categories_path, notice: "Title and description can not be empty"
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:description, :title, :due_date, :creator_id, :category_id)
  end
end
