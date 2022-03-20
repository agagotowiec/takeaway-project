class Order

  def initialize(menu)
    @menu = menu
    @my_order = []
  end
 
  def add_dish(dish)
    @dish = dish
    @price = @menu.receive_menu[dish]
    if @menu.receive_menu.has_key? dish
      @my_order << { @dish => @price }
    else
      "Item not on the menu. Please change your selection."
    end
  end

  def delete_dish(dish)
    @my_order.each do |item|
  item.each do |k, _|
  if k == dish
    return item.delete(k) 
  else
    return "Error! This item doesn't exist on your order list" 
  end
    end
    end
  end



def calculate
  bill = []
  sum = 0
  n = 0 
  stop = @my_order.length
  while n < stop do
  @my_order.each do |i|
    i.each do |key, value|
  bill << "#{key}: £#{value}0"
  sum += value
  n += 1
  end
  @your_order = bill.join(", ")
  @grand_total = sum
end
if @grand_total == 0
  return "No items"
else
return "Your order: #{@your_order}. So far total to pay: #{@grand_total}0"
end
end
end

end
