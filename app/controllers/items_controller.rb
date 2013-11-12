class ItemsController < ApplicationController

  def index
    if @current_category
      @items = @current_category.items
    else
      @items = Item.all
    end
  end

  def new
    @item = Item.new
  end

  def show
    current_category = params[:category]
    @item = Item.find(params[:id])
  end

  def create
    begin
      @item = Item.new(
        :title => params[:item][:title],
        :description => params[:item][:description],
        :price => params[:item][:price].to_f,
        :photo => params[:item][:photo].original_filename)
        flash.notice = "#{@item.title} was created" if @item.save
        redirect_to items_path
    rescue
      flash.notice = "Sorry, there was a problem with the item you tried to create.
      Please check your input and try again."
      redirect_to items_path
    end
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


