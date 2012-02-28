class UsersController < ApplicationController
  
  before_filter :get_user, only: [:show, :edit, :update, :destroy] # run get_user before accessing the #show or #edit methods
  
  respond_to :html, :json
  
  def index
    respond_with @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user]) # make a new user from the params passed from #new
    @user.password = params[:user][:password] # the protected attributes
    @user.password_confirmation = params[:user][:password_confirmation]
    
    flash[:notice] = "User Saved" if @user.save #save the user
    
    respond_with @user
  end
  
  def update
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    
    flash[:notice] = "User Saved" if @user.save #save the user
    
    respond_with @user
  end
  
  def destroy
    flash[:notice] = "User Deleted!" if @user.destroy
    respond_with @user
  end
  
  protected # protected methods
  
  def get_user
    @user = User.find(params[:id])
  end
end