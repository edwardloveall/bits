class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      cookies.permanent[:auth_token] = user.auth_token
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Username or password is incorrect!"
      render "new"
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    session[:user_id] = nil
    redirect_to root_url
  end
end