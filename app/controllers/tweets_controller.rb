class TweetsController < ApplicationController

	before_action :authenticate_user!

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user_id = current_user.id
		@tweet.save
		redirect_to tweets_path
	end

	def index
		@tweets = Tweet.all.page(params[:page]).per(5).order(created_at: :desc)
		# １ページ５件の表示・日付最新順
	end

	def hashtag
		@tag = Tag.find_by(tag_name: params[:tag_name])
		if  @tag.present?
			@tweets = @tag.tweets.page(params[:page]).per(6).order(created_at: :desc)
		else
			@tweets = Tweet.all.page(params[:page]).per(6).order(created_at: :desc)
		end
	end

	def show
		@tweet = Tweet.find(params[:id])
		@comment = Comment.new
		@comments = @tweet.comments.page(params[:page]).per(5)
	end

	def edit
		@tweet = Tweet.find(params[:id])
	end

	def update
		@tweet = Tweet.find(params[:id])
		if @tweet.update(tweet_params)
			redirect_to tweets_path
		else
			render :edit
		end
	end

	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		redirect_to tweets_path
	end

	private
	def tweet_params
		params.require(:tweet).permit(:body)
	end

end
