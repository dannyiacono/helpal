class Category < ApplicationRecord
  has_many :user_categories
  belongs_to :request
end
