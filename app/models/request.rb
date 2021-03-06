class Request < ApplicationRecord
  enum status: { pending: 0, ongoing: 1, done: 2, inactive: 3 }

  belongs_to :creator, class_name: "User"
  belongs_to :helper, class_name: "User", optional: true
  has_one :category
  has_one :review
  has_many :conversations
  validates :due_date, :city, :category_id, presence: true
  validates :title, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { in: 5..1000 }

  def expire
    self.status = 2
    self.save
  end
end
