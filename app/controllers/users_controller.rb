class UsersController < ApplicationController
  before_action :set_previous_page

  def index
    render :layout => 'bank_buddy'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && current_order.id
      ContactMailer.account_confirmation(@user).deliver
      session[:user_id] = @user.id
      current_order.save
      redirect_to order_path(current_order.id), :notice => "Signed up!"
    elsif @user.save && !current_order.id
      ContactMailer.account_confirmation(@user).deliver
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render "sessions/new", layout: "bank_buddy"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
      flash[:notice] = "Credentials updated!"
    else
      redirect_to user_path
      flash[:notice] = "Your account was not saved for some reason!"
    end
  end

  def show
    @user = current_user

    render :layout => 'bank_buddy'
  end

  def edit
    @user = current_user
    render :layout => 'bank_buddy'
  end

  def is_admin?
    current_user && current_user.admin
  end

  def prev_page
    if session[:prev_page]
      session[:prev_page]
    else
      root_url
    end
  end
  helper_method :prev_page

private

  def set_previous_page
    if params[:previous_page]
      session[:prev_page] = params[:previous_page]
    end
  end

  def set_user
    @user = user.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :full_name, :display_name, :password, :password_confirmation, :admin)
  end
end
