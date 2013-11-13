class ItemsController < ApplicationController
  before_action :load_category, :only => [:index, :in_category]

  before_action :load_category, :only => [:index, :in_category]
  def load_category
    @categories = Category.all
  end

  def index
    @items = Item.active
    @page_title = "Full Menu"
  end

  def in_category
    @category = Category.find_by_slug(params[:category_slug])
    @items = @category.items.active
    @page_title = @category.title
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

  def load_category
    @categories = Category.all
  end

end


