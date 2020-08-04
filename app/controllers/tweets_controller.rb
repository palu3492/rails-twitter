class TweetsController < ApplicationController
  # http_basic_authenticate_with name: "Alex", password: "123", except: [:index, :show]

  # GET /tweets
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/:id
  def show
    @tweet = Tweet.find(params[:id])
  end

  # GET /tweets/new
  def new
    
  end

  # POST /tweets
  def create
    # render plain: params[:tweet].inspect
    @tweet = Tweet.new(post_params)

    if @tweet.save
      redirect_to @tweet
    else
      # flash does not work when using redirect, need to use render
      # flash.now[:alert] = "Posts need to be between 1 and 280 characters"
      redirect_to home_path(@tweet)
    end
  end

  # GET /tweets/:id/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # PATCH or PUT /tweets/:id
  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(post_params)
      redirect_to @tweet
    else
      redirect_to edit_tweet_path(@tweet)
    end
  end

  # DELETE /tweets/:id
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private def post_params
    params.require(:tweet).permit(:title, :body)
  end
end
