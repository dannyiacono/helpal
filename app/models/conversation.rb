class Conversation < ApplicationRecord
  enum status: { pending: 0, declined: 1, confirmed: 2 }
  belongs_to :creator, foreign_key:  :creator_id, class_name: "User"
  belongs_to :helper, foreign_key: :helper_id, class_name: "User"
  has_many :messages
  belongs_to :request
  validates :request_id, presence: true

  def has_unread_messages(current_user)
    @unread_messages = self.messages.where.not(read: true, user: current_user)
    @unread_messages.count > 0 ? true : false
  end

  def includes_unread_messages?
    self.messages.where(read: false).present? ? true : false
  end
end
