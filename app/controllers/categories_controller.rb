class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.find(params[:id])
  end

  # def create
  #   @categories = Category.new(category_params)
  #   @categories.save

  #   flash.notice = "#{@categories.name} was created"
  #   redirect_to edit_item_path(@categories.id)
  # end

  # def edit
  #   @categories = Category.find(params[:id])
  # end

  # def update
  #   @categories = Category.find(params[:id])
  #   @categories.update(category_params)
  #   flash.notice = "#{@categories.name} was updated"
  #   redirect_to edit_category_path(@categories.id)   
  # end
end
