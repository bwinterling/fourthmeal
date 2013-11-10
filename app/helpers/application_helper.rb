module ApplicationHelper

  def navbar_order_link
    if current_order.id
      button_to "Your Order", order_path(current_order), class:"button order-link"
    else
      button_to "Order Now!", orders_path, method: :post, class:"button order-link"
    end
  end
  
end
