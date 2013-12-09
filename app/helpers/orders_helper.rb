module OrdersHelper

  def order_total(order_items)
    total = 0
    order_items.each {|i| total += (i.item.price * i.quantity) }
    total
  end

  def items_in_cart?
    current_order && current_order.order_items.count > 0
  end

end
