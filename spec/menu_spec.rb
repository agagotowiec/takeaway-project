require 'menu'

RSpec.describe Menu do
  it "allows user to see the menu" do
    menu = Menu.new
    expect(menu.see_menu).to eq "Pasta: £5.00, Calzone: £8.00, Pizza: £10.00, Toastie: £3.00"
  end
end
