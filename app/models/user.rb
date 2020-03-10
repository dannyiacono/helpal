class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :messages
  # has_many :requests, dependent: :destroy
  has_many :requests_as_creator, source: :requests, foreign_key: :creator_id, class_name: "Request"
  has_many :requests_as_helper, source: :requests, foreign_key: :helper_id, class_name: "Request"
  has_many :reviews, through: :requests
 has_many :conversations_as_creator, source: :conversations, foreign_key: :creator_id, class_name: "Conversation"
  has_many :conversations_as_helper, source: :conversations, foreign_key: :helper_id, class_name: "Conversation"
  validates :first_name, :last_name, :location, presence: true

  def requests
    requests_as_creator + requests_as_helper
  end

  def reviews
    reviews = []
    requests.each { |request| reviews << request.review unless request.review.nil?}
    reviews
  end

  def conversations
    conversations_as_helper + conversations_as_creator
  end

  def unread_messages?
   unread = conversations.find do |conversation|
    conversation if conversation.messages.any? do |message|
      message if message.read == false && message.user_id != self.id
      end
    end
    if unread.present?
      true
    else
      false
    end
  end

  def reviews_as_request_creator
    reviews.select { |review| review if review.request.creator == self}
  end

  def reviews_as_request_helper
    reviews.select { |review| review if review.request.creator != self}
  end

end
