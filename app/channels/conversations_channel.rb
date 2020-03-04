class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stream_from "conversation_#{params[:chat_room_id]}"
  end
end
