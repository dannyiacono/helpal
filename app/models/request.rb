class Request < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :helper, class_name: "User", optional: true
  has_one :category
  has_one :review
end
