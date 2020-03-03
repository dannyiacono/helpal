class ConversationsController < ApplicationController
  def index
  end

  def create
  end


  private

  def conversation_params
    params.permit(:creator_id, :helper_id)
 end
end
