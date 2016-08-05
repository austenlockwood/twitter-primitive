class WelcomeController < ApplicationController

  def index
    @user = User.new
  end

  def new
  end

  def create
  end

  def search
    @users = User.where("name LIKE ?", "%#{params[:q]}%")
  end
  
end
