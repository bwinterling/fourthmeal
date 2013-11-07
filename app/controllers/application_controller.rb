class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_order

  def current_order
    Order.find_by_id(session[:current_order]) || Order.new(user_id: 1, status: "ordered") 
  end

end
