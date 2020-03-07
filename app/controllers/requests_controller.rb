class RequestsController < ApplicationController

  def index
    @requests = policy_scope(Request).where(creator_id: current_user.id)
    authorize @requests
    @pending_requests = Request.pending
    @ongoing_requests = Request.ongoing
    @done_requests = Request.done
  end

  def show
    @request = Request.find(params[:id])
    @request.creator = current_user
    @new_request = Category.find(@request.category_id).name
    authorize @request
    @conversation = Conversation.all
  end

  def new
    @request = policy_scope(Request)
  end

  def create
    @request = Request.new(request_params)
    @request.creator_id = current_user.id
    authorize @request
     if @request.save
      redirect_to request_path(@request), notice: "Successfully saved your request"
     else
      redirect_to categories_path, notice: "Title and description can not be empty"
    end
  end

  def destroy
    @request = Request.find(params[:id])
    authorize @request
    @request.destroy
    redirect_to categories_path, notice: "Succesfully cancelled your request"
  end

  def update
    @request = Request.find(params[:id])
    @request.helper_id = params[:request][:helper_id]
    authorize @request
    if @request.save
      @helper_conversation = Conversation.find_by(request_id: @request.id, helper_id: @request.helper_id)
      @helper_conversation.status = 2;
      @helper_conversation.save;
      redirect_to request_path(@request)
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:description, :title, :due_date, :creator_id, :category_id, :city, :status)
  end
end
