class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @order = current_order
    # Order.find(params[:id])
    @order_items = @order.order_items
    @items = Item.all
  end

  def create
    @order = Order.create(:status => "unpaid", :user_id => 1)
    if params[:item]
      item = Item.find(params[:item])
      @order.order_items.build(item: item, quantity: 1) 
      @order.save
    end 
    session[:current_order] = @order.id
    redirect_to order_path(session[:current_order])
  end

  def update
    current_order.save
    @order = current_order
    id = @order.id
    @item = Item.find(params[:item])
    OrderItem.create(:order_id => id, :item_id => @item.id, :quantity => 1)
    redirect_to order_path(id)
  end

  def destroy
    @order_item = OrderItem.find(params[:oiid])
    @order_item.destroy
    redirect_to :back
  end

  def transaction
  end

  def purchase
  end

  private

  def order_params
    params.permit(:something)
  end
end
