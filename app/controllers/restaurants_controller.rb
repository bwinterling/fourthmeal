class RestaurantsController < ApplicationController
  layout "platform", :only => [:index, :new, :create]
  before_action :set_restaurant, only: [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.order('created_at DESC')
  end

  def show
    @restaurant = Restaurant.includes(:items).find_by(:slug => params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @restaurant }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find_by(:slug => params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name,
                                         :location,
                                         :description,
                                         :slug)
    end
end
