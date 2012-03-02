class ItemsController < ApplicationController
  before_filter :authorize, only: [:edit, :new, :destroy]
  respond_to :html, :json, :rss

  def index
    respond_with @items = Item.order("created_at DESC").page(params[:page])
  end

  def show
    respond_with @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.url = (defined? params['url']) ? params['url'] : nil
    @item.title = (defined? params['title']) ? params['title'] : nil
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
    flash[:notice] = "Updated Item" if @item.update_attributes(params[:item])
    respond_with @item
  end

  def destroy
    @item = Item.find(params[:id])
    flash[:notice] = "Deleted Item" if @item.destroy
    respond_with @item
  end
end