require 'send_message'

RSpec.describe SendMessage do
  it "sends order confirmation" do
    client = double(:client)
    send_message = SendMessage.new
    send_message.get_number("+441110111001")
    allow(client).to receive(:new).with("ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "cyyyyyyyyyyyyyyyyyyyyyyyyy").and_return(double1 = double(:double1))
    allow(double1).to receive(:messages).and_return(double2 = double(:double2))
    allow(double2).to receive(:create).with({ body: "Thank you. Your order was placed and will be delivered before 17:18",
    from: "+15551234567", to: "+441110111001" })
  end
end
