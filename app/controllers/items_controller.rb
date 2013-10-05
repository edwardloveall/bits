class ItemsController < ApplicationController
  before_filter :authorize, only: [:edit, :new, :destroy]
  before_filter :single_item, only: [:show, :edit]
  before_filter :disable_new_link, only: [:new, :edit]
  respond_to :html, :json, :rss

  def index
    respond_to do |format|
      format.html {
        @items = Item.order("created_at DESC").page(params[:page])
      }

      format.rss {
        @items = Item.order("created_at DESC").limit(50)
      }
    end
  end

  def show
    @bookmarklet = session[:bookmarklet]
    session[:bookmarklet] = nil
    respond_with @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.url = (defined? params['url']) ? params['url'] : nil
    @item.title = (defined? params['title']) ? params['title'] : nil
    session[:bookmarklet] = (defined? params['bookmarklet']) ? params['bookmarklet'] : false
    @item.user = current_user

    respond_with @item
  end

  def edit
    respond_with @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])
    flash[:notice] = "Item Saved" if @item.save
    respond_with @item
  end

  def update
    @item = Item.find(params[:id])
    flash[:notice] = "Item Updated" if @item.update_attributes(params[:item])
    respond_with @item
  end

  def destroy
    @item = Item.find(params[:id])
    flash[:notice] = "Item Deleted" if @item.destroy
    respond_with @item
  end

  private

  def single_item
    @delete_enabled = (params[:action] == 'show' or params[:action] == 'edit') and (params[:controller] == 'items') ? true : false
  end

  def disable_new_link
    # @new_item_endabled = (params[:action] == 'new' or params[:action] == 'edit') and (params[:controller] == 'items') ? true : false
    @new_item_endabled = false
  end

end
