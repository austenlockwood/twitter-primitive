class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id # Actually sign in
      redirect_to users_path
    else
      render :new
    end
  end

  def delete
  end
end
