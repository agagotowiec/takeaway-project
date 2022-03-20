1. Describe the Problem

1.
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

2.
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

3.
As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.
Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

4.
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

2. Design the Class System

```ruby

class Menu

  def initialize
  $menu_list = {"Pasta" => 5.0, "Calzone" => 8.0, "Pizza" => 10.0, "Toastie" => 3.0}
  end

  def see_menu
end

end


class Order

  def initialize
  @my_order = []
  end
 
 
  def add_dish(dish)
end

def delete_dish(dish)
end
  
  def see_order
  @my_order
  end

 end


class Receipt

def initialize(order)
#order is an instance of order class
end

def get_receipt
#uses see_order method to list order and calculates grand total
end

end

# class Notification

# def initialize(order)
# #order is an instance of Order class
# @order = order
# end

# def send_message
# #returns message such as "Thank you! Your order was placed and will be delivered before 18:52" 
# end
# end


3. Create Examples as Integration Tests

ORDER + MENU INTEGRATION

# #1.
# it "allows user to add items from the menu into the order" do
# menu = Menu.new
# order = Order.new
# order.add_dish("Pizza")
# expect(order.see_order).to eq ["Pizza"]

# #2.
# context "when user is trying to add dish not availble on the menu" do
# it "fails" do
# menu = Menu.new
# order = Order.new
# order.add_dish
# expect { order.see_order }.to raise_error "Item not on the menu. Please change your selection."

# #3.
# context "when user wants to remove dish from the order" do
# it "removes that dish from the order" do
# menu = Menu.new
# dish1 = Order.new
# dish2 = Order.new
# dish1.add_dish("Pizza")
# dish2.add_dish("Calzone")
# dish1.delete_dish("Pizza")
# expect(order.see_order).to eq ["Calzone"]




RECEIPT + ORDER INTEGRATION

it "provides an itemised receipt" do
order = Order.new
receipt = Receipt.new(order)
expect(receipt.get_receipt).to eq "You have ordered: chicken, price: 10.00 + lamb, price: 12.00. Total cost: 22.00"


NOTIFICATION + ORDER INTEGRATION

4. Create Examples as Unit Tests


CLASS MENU

# #1. initially
# context "initially constructs" do
# it "allows user to see a list of dishes" do
# menu = Menu.new
# expect(menu.see_our_menu).to eq ["Pasta, £5", "Calzone, £8", "Pizza, £10"]


CLASS ORDER #REQUIRES:   doubles :fake_menu  mark_available method: true/false 

# #1. 
# it "allows user to place the order" do
# order = Order.new
# fake_menu = double :fake_menu mark_available: true
# order.add_dish
# order.place_order
# expect(order.see_order).to eq [order]


# #2
# it "allows user to delete dish from his order" do
# order = Order.new
# fake_menu = double :fake_menu mark_available: true
# order.add_dish
# order.delete("fish")
# order.place_order
# expect(order.see_order).to eq [order]

# #3
# context "when user is trying to delete the dish that is not on the order list" do
# it "fails" do
# order = Order.new
# fake_menu = double :fake_menu mark_available: true
# order.add_dish #assumption: user adds beef
# expect { order.delete("fish") }.to raise_error "You cannot delete item that doesn't exist in your order list"



CLASS RECEIPT #requires: :fake_order see_order method

it "provides an itemised receipt" do
order = double :fake_order see_order: 
receipt = Receipt.new(order)
expect(receipt.get_receipt).to eq "Here is your order: "

CLASS NOTIFICATION

5. Implement the Behaviour