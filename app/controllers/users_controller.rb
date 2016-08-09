class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new
    @tweet = Tweet.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: @user.id)
    @tweet = Tweet.new
  end

  def search
    @users = User.where("name LIKE ?", "%#{params[:q]}%")
    redirect_to user_path
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  private def user_params
    params.require(:user).permit(
    :name,
    :email,
    :password,
    :password_confirmation
    )

  end
end
