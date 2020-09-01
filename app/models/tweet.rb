class Tweet < ApplicationRecord
	belongs_to :user

	has_many :tweet_tags, dependent: :destroy
	has_many :tags, through: :tweet_tags, dependent: :destroy

	after_create do
		tags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		tags.uniq.map do |t|
			tag = Tag.find_or_create_by(tag_name: t.downcase.delete('#'))
			TweetTag.find_or_create_by(tweet_id:self.id,tag_id:tag.id)
		end
	end
end
