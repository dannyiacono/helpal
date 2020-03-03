class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = policy_scope(Conversation)
    @user_conversations = []
    @conversations.each do |conversation|
      @user_conversations << conversation if (conversation.creator_id == current_user.id || conversation.helper_id == current_user.id)
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = []
    Message.where(conversation_id: @conversation.id).find_each do |message|
      @messages << message
    end
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
