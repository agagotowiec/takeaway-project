class Menu

  def initialize
    @menu_list = { "Pasta" => 5.0, "Calzone" => 8.0, "Pizza" => 10.0, "Toastie" => 3.0 }
  end
 
  def receive_menu
    @menu_list
  end

  def see_menu
    menu = []
    @menu_list.each { |dish, price| menu << "#{dish}: £#{price}0" }
    menu.join(", ")
  end
end
