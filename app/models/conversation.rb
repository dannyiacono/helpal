class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key:  :sender_id, class_name: "User"
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"
  has_many :messages
  belongs_to :request

  validates :request_id, presence: true
  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :between, -> (creator_id,helper_id) do
 where("(conversations.creator_id = ? AND conversations.helper_id = ? ) OR (conversations.creator_id = ? AND conversations.helper_id = ? )", creator_id,helper_id, helper_id, creator_id)
 end
end
