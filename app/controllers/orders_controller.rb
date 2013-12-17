class OrdersController < ApplicationController

  helper_method :add_item_to_order

  def new
    @order = Order.new
  end

  def show
    @page_title = "Your Order"
    @order = current_order
    @order_items = @order.order_items
    @items = Item.active.limit(10)
    if @order_items.count < 1
      redirect_to root_path
    end
  end

  def create
    @order = Order.create(:user_id => 1,
                          :restaurant_id => current_restaurant.id)
    if params[:item]
      item = Item.find(params[:item])
      @order.order_items.build(item: item, quantity: 1)
      @order.save
    end
    session[:orders] = [] unless session[:orders]
    session[:orders] << @order.id
    redirect_to :back
  end

  def update
    current_order.save
    @order = current_order
    @item = Item.find(params[:item])
    add_item_to_order
    flash[:notice] = "Added #{@item.title} to your cart."
    redirect_to :back
  end

  def destroy
    @order = Order.find(params[:id])
    @order.items.destroy_all
    flash[:notice] = "Your order was successfully cancelled."
    redirect_to :back
  end

  private

  def order_params
    params.permit(:something)
  end

  def add_item_to_order
    if current_order.order_items.find_by_item_id(params[:item])
      @order_item = current_order.order_items.find_by_item_id(params[:item])
      current_count = @order_item.quantity
      @order_item.update(:quantity => current_count + 1)
    else
      @order_item = OrderItem.create(
        :order_id => current_order.id,
        :item_id => @item.id,
        :quantity => 1)
    end
  end

end
