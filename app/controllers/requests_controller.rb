class RequestsController < ApplicationController

  def index
    @requests = policy_scope(Request).where(creator_id: current_user.id)
    @pending_requests = @requests.pending
    @ongoing_requests = @requests.ongoing
    @done_requests = @requests.done
  end

  def show
    @request = Request.find(params[:id])
    @new_request = Category.find(@request.category_id).name
    authorize @request
    @conversation_count = @request.conversations.count
    @id = @request.helper_id
    @id ? @helper = User.find(@id) : @helper = nil
    @helper_conversation = Conversation.find_by(request_id: @request.id, helper_id: current_user.id, creator_id: @request.creator_id)
    @conversation = Conversation.new
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
    redirect_to requests_path, notice: "Successfully cancelled your request"
  end

  def update
    @request = Request.find(params[:id])
    if params[:commit] == "Confirm pal"
      @request.helper_id = params[:helper_id]
      @request.status = 1
      authorize @request
      if @request.save
        @helper_conversation = Conversation.find_by(request_id: @request.id, helper_id: @request.helper_id)
        @helper_conversation.status = 2
        if @helper_conversation.save
          redirect_to conversation_path(@helper_conversation)
        else
          redirect_to conversation_path(@helper_conversation), notice: "Something went wrong: Please try again"
        end
      end
    else
      authorize @request
      @helper_conversation = Conversation.find_by(request_id: @request.id, helper_id: params[:helper_id])
      @helper_conversation.status = 1
      if @helper_conversation.save
        redirect_to conversations_path
      else
        redirect_to conversation_path(@helper_conversation), notice: "Something went wrong: Please try again"
      end
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
