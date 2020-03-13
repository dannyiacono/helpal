class ConversationsController < ApplicationController

  def index
    @conversations = policy_scope(Conversation)
    @user_conversations = []
    @conversations.each do |conversation|
      @user_conversations << conversation if (conversation.creator_id == current_user.id || conversation.helper_id == current_user.id)
    end
    @user_conversations
    @unread_user_conversations = []
    @user_conversations.each { |conversation| @unread_user_conversations << conversation if conversation.includes_unread_messages?}
    raise
  end

  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
    if current_user.id == @conversation.creator_id
      @other_user = User.find(@conversation.helper_id)
    else
      @other_user = User.find(@conversation.creator_id)
    end
    @request = Request.find(@conversation.request_id)
    @messages = []
    Message.where(conversation_id: @conversation.id).find_each do |message|
      @messages << message
    end
    @messages.each do |message|
      if current_user.id != message.user_id
        message.read = true
        message.save
      end
    end
    @message = Message.new
  end

  def create
    @conversation = Conversation.create(conversation_params)
    authorize @conversation
    redirect_to conversation_path(@conversation)
  end


  private

  def conversation_params
    params.require(:conversation).permit(:creator_id, :helper_id, :request_id)
  end
end
