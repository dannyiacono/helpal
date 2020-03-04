class MessagesController < ApplicationController
  before_action do
   @conversation = Conversation.find(params[:id])
  end

  def index
    @messages = @conversation.messages
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end
    @message = @conversation.messages.new
    authorize @message
  end


  def new
    @message = policy_scope(Message)
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
