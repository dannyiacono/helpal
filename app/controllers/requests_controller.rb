class RequestsController < ApplicationController

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
    else
      redirect_to categories_path, notice: "Title and description can not be empty"
    end
  end

  def destroy
    @request = Request.find(params[:id])
    authorize @request
    @request.destroy
    redirect_to request_path, notice: "Succesfully cancelled your request"
  end

  private

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:description, :title, :due_date, :creator_id, :category_id, :city)
  end

  end
