require 'rails_helper'

RSpec.describe Tweet, type: :model do
	context "データが正しく保存される" do
		before do
			@tweet = Tweet.new
			@tweet.body = "こんにちは"
			@tweet.user_id = user.id
			@tweet.save
		end
		it "全て入力してるので保存される" do
			expect(@tweet).to be_valid
		end
	end
end