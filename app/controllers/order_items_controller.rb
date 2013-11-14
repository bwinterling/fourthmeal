class OrderItemsController < ApplicationController

  def destroy
    OrderItem.find(params[:oiid]).destroy
    if current_order.order_items.count > 0
      flash[:notice] = "The item was removed from your cart."
    else
      flash[:notice] = "Your order has been cancelled."
    end
    redirect_to order_path(current_order.id)
  end
  
end