class UsersController < ApplicationController
  
  before_filter :get_user, only: [:show, :edit, :update, :destroy] # run get_user before accessing the #show or #edit methods
  before_filter :authorize, except: [:show, :index]
  respond_to :html, :json, :rss
  
  def index
    respond_with @users = User.all
  end
  
  def new
    @user = User.new
    @colors = Color.all
  end
  
  def show
    @items = @user.items.order("created_at DESC").page(params[:page])
  end
  
  def create
    @user = User.new(params[:user]) # make a new user from the params passed from #new
    @user.color_id = params[:user][:color_id]
    @user.password = params[:user][:password] # the protected attributes
    @user.password_confirmation = params[:user][:password_confirmation]
    
    flash.notice = "User Saved" if @user.save #save the user
    
    respond_with @user
  end
  
  def update
    @user.name = params[:user][:name]
    @user.username = params[:user][:username]
    @user.color_id = params[:user][:color_id]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    
    flash.notice = "User Saved" if @user.save #save the user
    
    respond_with @user
  end
  
  def destroy
    flash.notice = "User Deleted!" if @user.destroy
    respond_with @user
  end
  
  protected # protected methods
  
  def get_user
    @user = User.find(params[:id])
    @colors = Color.all
  end
end