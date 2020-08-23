class TweetsController < ApplicationController

	def new
		@tweet = Tweet.new
	end

	def create
		tweet = Tweet.new(tweet_params)
		tweet.save
		redirect_to tweets_path
	end

	def index
		@tweets = Tweet.all
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def tweet_params
		params.require(:tweet).permit(:user_id, :body)
	end

end
