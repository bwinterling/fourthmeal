class ItemsController < ApplicationController

  def index
    if @current_category
      @items = @current_category.items
    else
      @items = Item.active
    end
  end

  def in_category
    @category = Category.find_by_slug(params[:category_slug])
    @items = @category.items
    render :index
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(
      :title => params[:item][:title],
      :description => params[:item][:description],
      :price => params[:item][:price].to_f,
      :photo => params[:item][:photo])

    if @item.save!
      flash.notice = "#{@item.title} was created"
      redirect_to items_path
    else
      flash.notice = "Sorry, there was a problem with the item you tried to create.
      Please check your input and try again."
      render :new
    end
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
    params.require(:item).permit(:title, :description, :price, :photo, :photo_file_name)
  end

end


