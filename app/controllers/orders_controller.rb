class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.all.last
    # Order.find(params[:id])
    @order_items = @order.items
  end

  def create
    @order = Order.create(:status => "ordered", :user_id => 1)
    id = @order.id
    @item = Item.find(params[:item])
    OrderItem.create(:order_id => id, :item_id => @item.id, :quantity => 1)

    session[:current_order] = id

    redirect_to items_path
  end

  def edit
    @order = Order.find(params[:id])

  end

  def update
    # @order = Order.find(params[:id])
    @order = current_order
    id = @order.id
    @item = Item.find(params[:item])
    OrderItem.create(:order_id => id, :item_id => @item.id, :quantity => 1)
    # @order_item = OrderItem.find(params[:item])
    # @order_item.title
    redirect_to items_path
  end

  def order_params
    params.permit(:something)
  end
end
