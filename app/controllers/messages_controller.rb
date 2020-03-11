class MessagesController < ApplicationController
  before_action :skip_authorization
  # before_action do
  #  @conversation = Conversation.find(params[:id])
  # end

  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end
    @message = @conversation.messages.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      @message.update_conversation
      redirect_to conversation_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
