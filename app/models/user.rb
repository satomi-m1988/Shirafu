class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :adult, acceptance: true, on: :create
  # チェックボックスが空欄だとバリデーションが実行される

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  	has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  	has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
  	passive_relationships.find_by(following_id: user.id).present?
  end

  attachment :image
end
