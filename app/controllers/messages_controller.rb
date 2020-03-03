class MessagesController < ApplicationController
  before_action do
   @conversation = Conversation.find(params[:id])
  end

  def index
    @messages = @conversation.messages
    authorize @messages
  end

  def new
    @message = @conversation.messages.new
    authorize @authorize
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user_id = current_user.id
    authorize @message
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
