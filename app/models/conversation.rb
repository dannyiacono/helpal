class Conversation < ApplicationRecord
  enum status: { pending: 0, declined: 1, confirmed: 2 }
  belongs_to :creator, foreign_key:  :creator_id, class_name: "User"
  belongs_to :helper, foreign_key: :helper_id, class_name: "User"
  has_many :messages
  belongs_to :request

  validates :request_id, presence: true
  validates_uniqueness_of :creator_id, scope: :helper_id

  scope :between, -> (creator_id,helper_id) do
 where("(conversations.creator_id = ? AND conversations.helper_id = ? ) OR (conversations.creator_id = ? AND conversations.helper_id = ? )", creator_id,helper_id, helper_id, creator_id)
 end
end
