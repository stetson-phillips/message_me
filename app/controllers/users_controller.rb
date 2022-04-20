class UsersController < ApplicationController
  before_action :logged_in_redirect, only:[:new, :create]
  def new
    user = User.find_by(username: params[:user][:username])
    if user
      flash[:error] = "This username already exists"

    else 
      user = User.new
      user.username = params[:user][:username]
      user.password = params[:user][:password]
      user.save
      flash[:success] = "Your account has been created"
    end
    redirect_to login_url
  end

  def destroy
  end

  private
  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end

  end
end