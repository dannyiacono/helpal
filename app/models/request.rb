class Request < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :helper, class_name: "User"
  has_one :category
end
