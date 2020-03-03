class ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    @conversations = []
    Conversation.where(creator_id: current_user.id || helper_id: current_user.id).find_each do |conversation|
      @conversations << conversation
    end
  end

  def create
 if Conversation.between(params[:creator_id],params[:helper_id])
   .present?
    @conversation = Conversation.between(params[:creator_id],
     params[:helper_id]).first
 else
  @conversation = Conversation.create!(conversation_params)
 end
 redirect_to conversation_messages_path(@conversation)


  private

  def conversation_params
    params.permit(:creator_id, :helper_id)
 end
end
