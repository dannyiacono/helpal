class ConversationsController < ApplicationController
  before_action :skip_authorization

  def index
    @conversations = policy_scope(Conversation)
    @user_conversations = []
    @conversations.each do |conversation|
      @user_conversations << conversation if (conversation.creator_id == current_user.id || conversation.helper_id == current_user.id)
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    if current_user.id == @conversation.creator_id
      @other_user = User.find(@conversation.helper_id)
    else
      @other_user = User.find(@conversation.creator_id)
    end
    @request = Request.find(@conversation.request_id)
    @messages = @conversation.messages
    @messages.each do |message|
      if current_user.id != message.user_id
        message.read = true
        message.save
      end
    end
    @message = Message.new
  end

  def create
    if Conversation.between(params[:creator_id],params[:helper_id]).present?
      @conversation = Conversation.between(params[:creator_id], params[:helper_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
      authorize @conversation
    end
    redirect_to conversation_messages_path(@conversation)
  end


  private

  def conversation_params
    params.permit(:creator_id, :helper_id)
  end
end
