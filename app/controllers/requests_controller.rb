class RequestsController < ApplicationController

  def index
    @requests = policy_scope(Request).where(creator_id: current_user.id)
    @pending_requests = @requests.pending
    @ongoing_requests = @requests.ongoing
    @done_requests = @requests.done
    @helping_requests = policy_scope(Request).where(helper_id: current_user.id)
    @ongoing_help_requests = @helping_requests.ongoing
    @done_help_requests = @helping_requests.done
  end

  def show
    @request = Request.find(params[:id])
    @new_request = Category.find(@request.category_id).name
    authorize @request
    @conversation_count = @request.conversations.count
    @helper_conversation = Conversation.find_by(request_id: @request.id, helper_id: @request.helper, creator_id: @request.creator_id)
    @helper_unconfirmed_conversation = Conversation.where(helper_id: current_user.id, request_id: params[:id]).first
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
    @request.status = 3
    @request.save
    redirect_to requests_path, notice: "Successfully cancelled your request"
  end

  def update
    @request = Request.find(params[:id])
    if params[:commit] == "Confirm pal"
      @request.helper_id = params[:helper_id]
      @request.status = 1
      authorize @request
      if @request.save
        update_helper_conversation(@request)
      end
    else
      authorize @request
      update_helper_conversation(@request)
    end
  end

  private

  def update_helper_conversation(request)
    @helper_conversation = Conversation.find_by(request_id: @request.id, helper_id: params[:helper_id])
    if @request.helper_id.nil?
      @helper_conversation.status = 1
      if @helper_conversation.save
        redirect_to conversations_path
      else
        redirect_to conversation_path(@helper_conversation), notice: "Something went wrong: Please try again"
      end
    else
      @helper_conversation.status = 2
      if @helper_conversation.save
        redirect_to conversation_path(@helper_conversation)
      else
        redirect_to conversation_path(@helper_conversation), notice: "Something went wrong: Please try again"
      end
    end
  end

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:description, :title, :due_date, :creator_id, :category_id, :city, :status)
  end
end
