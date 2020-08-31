class CommentsController < ApplicationController

  def create
  	@tweet = Tweet.find(params[:tweet_id])
  	@comment = @tweet.comments.build(comment_params)
  	@comment.user_id = current_user.id
  	@comment.save
  	render :index #index.jsファイルを探しにいく記述
  end

  def destroy
    @comment = Comment.find(params[:id])
    @tweet = Tweet.find(params[:tweet_id])
    @comment.destroy
    render :index
  end

  private
  def comment_params
  	params.require(:comment).permit(:comment_body, :user_id, :tweet_id)
  end

end
