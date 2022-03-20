require 'order'

RSpec.describe Order do
  it "allows user to see the order" do
    fake_menu = FakeMenu.new
    order = Order.new(fake_menu)
    order.add_dish("Pasta")
    expect(order.calculate).to eq "Your order: Pasta: £5.00. So far total to pay: 5.00"
  end
  it "allows user to delete dish from his order" do
    fake_menu = FakeMenu.new
    order = Order.new(fake_menu)
    order.add_dish("Calzone")
    order.delete_dish("Calzone")
    expect(order.calculate).to eq "No items"
  end
  context "when user is trying to delete the dish that is not on the order list" do
    it "fails" do
      fake_menu = FakeMenu.new
      order = Order.new(fake_menu)
      order.add_dish("Pasta")
      expect(order.delete_dish("Toastie")).to eq "Error! This item doesn't exist on your order list"
    end
  end

end

class FakeMenu

  def receive_menu
    @menu_list = { "Pasta" => 5.0, "Calzone" => 8.0, "Pizza" => 10.0, "Toastie" => 3.0 }
  end
end
