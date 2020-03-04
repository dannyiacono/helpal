class Conversation < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :helper, class_name: "User"
  has_many :messages

  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :between, -> (creator_id,helper_id) do
 where("(conversations.creator_id = ? AND conversations.helper_id = ? ) OR (conversations.creator_id = ? AND conversations.helper_id = ? )", creator_id,helper_id, helper_id, creator_id)
 end
end
