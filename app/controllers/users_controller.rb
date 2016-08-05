class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_welcome_path
    else
      render :new
    end

  end

  # def show
  #   @user = User.find_by(name: params["name"])
  #   @tweets = Tweet.where(user_id: @user.id)
  #   @tweet = Tweet.new
  # end

  def search
    @users = User.where("name LIKE ?", "%#{params[:q]}%")
    redirect_to tweet_path
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end
