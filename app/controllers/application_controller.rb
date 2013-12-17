class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  delegate :allow?, to: :current_permission

  helper_method :allow?
  helper_method :current_user
  helper_method :current_order
  helper_method :current_order_total
  helper_method :current_order_empty?
  helper_method :current_restaurant

  def current_order
    #@current_order ||= Order.find_by_id(session[:current_order]) || Order.new
    if session[:orders] && current_restaurant
      #order_id = session[:orders].find {|order| order.restaurant_id == current_restaurant.id}
      orders = session[:orders].map{|order_id| Order.find(order_id)}
      order = orders.find {|order| order.restaurant_id == current_restaurant.id}

      @current_order ||= order || Order.new
    else
      @current_order = Order.new
    end 
  end

  def current_restaurant
    @current_restaurant ||= Restaurant.find_by(:slug => params[:id]) ||
      Restaurant.find_by(:slug => params[:restaurant_id])
  end

  def categories
   @categories ||= Category.all
  end

  def current_order_total
    order_total(current_order.order_items).to_i
  end

  private

   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   def current_permission
     @current_permission ||= Permission.new(current_user)
   end

   def current_order_empty?
    current_order.items.empty?
   end

end
