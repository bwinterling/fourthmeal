class RegionRestaurantsController < ApplicationController

  def index
    @region = Region.find_by(:slug => params[:region_id])
    @restaurants = @region.restaurants
    render :text => params.inspect
  end
end
