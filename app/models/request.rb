class Request < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :helper, class_name: "User", optional: true
  has_one :category
  has_one :review
  has_many :conversations
  validates :due_date, presence: true
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { in: 5..500 }
end
