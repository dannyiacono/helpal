class RequestsController < ApplicationController

  def new
    @request = policy_scope(Request)
  end

  def create
    @request = Request.new(request_params)
    @request.creator_id = current_user.id
    authorize @request
    if @request.save
      redirect_to request_path(@request)
    else
      render :template => 'requests/new'
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:description, :due_date, :creator_id, :category_id, :title)
  end
end
