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
    respond_to do |format|
      format.html {
        @items = @user.items.order("created_at DESC").page(params[:page])
      }

      format.rss {
        @items = @user.items.order("created_at DESC").limit(50)
      }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "User Saved"
      redirect_to @user
    else
      render :new
    end
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

  private

  def user_params
    params.require(:user).permit(:name, :username, :color_id, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
    @colors = Color.all
  end
end
