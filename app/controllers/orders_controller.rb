class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def create
    @order = Order.create(order_params)
  end

  def order_params
    params.permit(:something)
  end
end
