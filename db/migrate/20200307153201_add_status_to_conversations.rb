class AddStatusToConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :status, :integer, default: 0
  end
end
