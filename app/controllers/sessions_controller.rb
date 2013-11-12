class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      current_order.save
      redirect_to order_path(current_order.id), :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:order_id)
    session[:user_id] = nil
    session[:current_order] = Order.new
    redirect_to root_url, :notice => "Logged out!"
  end

end
