class AddRequestToConversations < ActiveRecord::Migration[5.2]
  def change
    add_reference :conversations, :request, foreign_key: true
  end
end
