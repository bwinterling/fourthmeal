class ItemCategoriesController < ApplicationController
  def new
    @item_category = ItemCategory.new
  end
  
  def show
    @item_category = ItemCategory.find(params[:id])
  end
end
