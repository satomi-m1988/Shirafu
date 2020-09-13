class TweetTag < ApplicationRecord
  belongs_to :tweet, dependent: :destroy
  belongs_to :tag, dependent: :destroy

  validates :tweet_id, presence: true
  validates :tag_id, presence: true
end
