class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :comment_body, presence: true, length: { maximum: 280 }
end
