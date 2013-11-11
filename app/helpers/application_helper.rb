module ApplicationHelper

  def navbar_order_link
    if current_order.id
      button_to "Your Order", order_path(current_order), method: :get, class:"button order-link"
    else
      button_to "Order Now!", orders_path, method: :get, class:"button order-link"
    end
  end
  
end
