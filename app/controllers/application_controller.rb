class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  

  # TO DO - put this into the transaction controller
  # before_action :authorize, only: [:post]
  
  delegate :allow?, to: :current_permission

  helper_method :allow?
  helper_method :current_user
  helper_method :current_order

  def current_order
    Order.find_by_id(session[:current_order]) || Order.new(status: "unpaid") 
  end

   private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_permission
      @current_permission ||= Permission.new(current_user)
    end

    # def authorize
    #   if !current_permission.allow?(params[:controller], params[:action])
    #     redirect_to root_url, alert: "Not authorized"
    #   end
    # end

end
