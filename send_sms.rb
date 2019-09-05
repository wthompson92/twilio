require 'sinatra'
require 'pry'

require 'twilio-ruby'

account_sid = 'ACc236fa3c7b7250c8676a603dfea73934'
auth_token = '8cbacfca5e7db0988bfe13d09a7a5017'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+18323915373' # Your Twilio number
to = '+17138518023' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
