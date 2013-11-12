class ItemsController < ApplicationController

  def index
    @items = params[:category] ? Item.filter_by_category(params[:category]) : Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save

    flash.notice = "#{@item.name} was created"
    redirect_to edit_item_path(@item.id)
    #redirect_to admin_items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    flash.notice = "#{@item.name} was updated"
    redirect_to edit_item_path(@item.id)
    #redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo)
  end

end

# /items?category=Spicy
