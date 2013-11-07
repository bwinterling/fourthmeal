class ItemsController < ApplicationController

  def index
    @items = params[:category] ? Item.filter_by_category(params[:category]) : Item.all
  end

  def show
    @item = Item.find(params[:id])
  end


end

# /items?category=Spicy
