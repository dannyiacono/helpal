class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :messages
  has_many :requests, dependent: :destroy
  has_many :requests_as_creator, source: :requests, foreign_key: :creator_id, class_name: "Request"
  has_many :requests_as_helper, source: :requests, foreign_key: :helper_id, class_name: "Request"
  has_many :reviews, through: :requests
  has_many :conversations_as_creator, source: :conversations, foreign_key: :creator_id
  has_many :conversations_as_helper, source: :conversations, foreign_key: :helper_id
  validates :first_name, :last_name, :location, presence: true

end
