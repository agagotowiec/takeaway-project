
require 'rubygems'
require 'twilio-ruby'

class SendMessage

  def get_number(number)
    @number = number
    account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    auth_token = 'cyyyyyyyyyyyyyyyyyyyyyyyyy'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    time = Time.now.to_s
    time = DateTime.parse(time).strftime("%H:%M")

    message = @client.messages
    .create(
     body: "Thank you. Your order was placed and will be delivered before #{time}.",
     from: "+15551234567",
     to: "#{@number}"
    )

  end
end
