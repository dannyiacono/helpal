class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  validates :body, presence: true, allow_blank: true

  def update_conversation
    self.conversation.update(updated_at: self.created_at)
    self.conversation.save
  end
end
