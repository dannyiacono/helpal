class Request < ApplicationRecord
  enum status: { pending: 0, ongoing: 1, done: 2 }

  belongs_to :creator, class_name: "User"
  belongs_to :helper, class_name: "User", optional: true
  has_one :category
  has_one :review
  validates :due_date, presence: true
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { in: 5..500 }
end
