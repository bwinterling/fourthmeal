module ApplicationHelper

  def navbar_order_link
    if current_order.id
      button_to "Your Order", order_path(current_order), method: :get, class:"button order-link"
    else
      button_to "Order Now!", new_order_path, method: :get, class:"button order-link"
    end
  end

  def page_title
    if @page_title
      "- #{@page_title}"
    elsif content_for?(:title)
      "- " + content_for(:title)
    end
  end

  def categories
    @categories ||= Category.all
  end

  ## MAY NEED TO BE
  
  # def navbar_order_link
  #   if current_order.id
  #     button_to "Your Order", order_path(current_order), method: :get, class:"button order-link"
  #   else
  #     button_to "Order Now!", orders_path, method: :post, class:"button order-link"
  #   end
  # end
  
end
