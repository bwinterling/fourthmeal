module OrdersHelper

  # TO DO: Change this to inject
  def order_total(order_items)
    total = 0
    order_items.each {|i| total += (i.item.price * i.quantity) }
    total
  end
  
end
