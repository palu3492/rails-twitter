class CommentsController < ApplicationController

  # http_basic_authenticate_with name: "Alex", password: "123", only: [:destroy]

  def create
    @tweet = Tweet.find(params[:post_id])
    @comment = @tweet.comments.create(comment_params)
    redirect_to tweet_path(@tweet)
  end

  def destroy
    @tweet = Tweet.find(params[:post_id])
    @comment = @tweet.comments.find(params[:id])
    @comment.destroy
    redirect_to tweet_path(@tweet)
  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end

end
