class SessionsController < ApplicationController
  def new
    @user = User.new #not sure I need this
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id # Actually sign in
      redirect_to tweets_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to login_path
  end
end
