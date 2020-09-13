class CommentsController < ApplicationController

before_action :authenticate_user!

  def create
  	@tweet = Tweet.find(params[:tweet_id])
  	@comment = @tweet.comments.build(comment_params)
  	@comment.user_id = current_user.id
  	@comment.save
    redirect_to tweet_path(params[:tweet_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @tweet = Tweet.find(params[:tweet_id])
    @comment.destroy
    redirect_to tweet_path(params[:tweet_id])
  end

  private
  def comment_params
  	params.require(:comment).permit(:comment_body, :user_id, :tweet_id)
  end

end
