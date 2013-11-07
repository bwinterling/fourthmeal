module ApplicationHelper

  def navbar_order_link
    if current_order.id
      link_to "Your Order", order_path(current_order)
    else
      link_to "Order Now!", items_path
    end
  end
end
