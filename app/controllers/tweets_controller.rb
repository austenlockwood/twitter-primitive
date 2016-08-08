class TweetsController < ApplicationController

  def index
    #code
  end

  def new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @user = @tweet.user
    redirect_to "/users/#{@user.name}"
  end

  def edit
  end

  def delete
  end
end
