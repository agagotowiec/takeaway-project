require 'menu'
require 'order'

RSpec.describe "Menu-Order integration" do
  it "allows user to add items from the menu into the order" do
    menu = Menu.new
    order = Order.new(menu)
    order.add_dish("Toastie")
    order.add_dish("Calzone")
    order.add_dish("Pasta")
    order.add_dish("Pasta")
    order.add_dish("Pizza")
    expect(order.calculate).to eq "Your order: Toastie: £3.00, Calzone: £8.00, Pasta: £5.00, Pasta: £5.00, Pizza: £10.00. So far total to pay: 31.00"
  end
  context "when user is trying to add dish not availble on the menu" do
    it "returns message asking to change selection" do
      menu = Menu.new
      order = Order.new(menu)
      expect(order.add_dish("Chicken")).to eq "Item not on the menu. Please change your selection."
    end
  end
  context "when user wants to remove dish from the order" do
    it "removes that dish from the order" do
      menu = Menu.new
      order = Order.new(menu)
      order.add_dish("Toastie")
      order.add_dish("Calzone")
      order.add_dish("Pasta")
      order.add_dish("Pizza")
      order.delete_dish("Toastie")
      expect(order.calculate).to eq "Your order: Calzone: £8.00, Pasta: £5.00, Pizza: £10.00. So far total to pay: 23.00"
    end
  end
  context "when user wants to remove non-existing dish from the order" do
    it "removes that dish from the order" do
      menu = Menu.new
      order = Order.new(menu)
      order.add_dish("Toastie")
      order.add_dish("Calzone")
      order.add_dish("Pasta")
      expect(order.delete_dish("Pizza")).to eq "Error! This item doesn't exist on your order list"
    end
  end
end
