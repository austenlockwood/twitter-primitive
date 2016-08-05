class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end

  end

  def search
    @users = User.where("name LIKE ?", "%#{params[:q]}%")
    redirect_to tweet_path
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end
