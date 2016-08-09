class TweetsController < ApplicationController

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.where(user_id: current_user.id)
  end

  def new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @tweet.update(user_id: current_user.id)
    redirect_to tweets_path
  end

  def edit
  end

  def delete
  end


  private def tweet_params
    params.require("tweet").permit(:body, :user_id)
  end
end
